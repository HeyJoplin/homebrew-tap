# Based on:
#   https://github.com/Homebrew/homebrew-cask/blob/main/Casks/v/vlc%40nightly.rb
#
# Removes the conflict with Cask VLC by renaming the app.
#
cask "vlcdev" do
  arch arm: "arm64", intel: "x86_64"
  livecheck_arch = on_arch_conditional arm: "arm64", intel: "intel64"
  on_arm do
    version "4.0.0,20260308-0411,f12988ae"
    sha256 :no_check
  end
  on_intel do
    version "4.0.0,20260308-0411,f12988ae"
    sha256 :no_check
  end

  url "https://artifacts.videolan.org/vlc/nightly-macos-#{arch}/#{version.csv.second}/vlc-#{version.csv.first}-dev-#{livecheck_arch}-#{version.csv.third}.dmg"
  name "VLC media player"
  desc "(GIAN) Open-source cross-platform multimedia player"
  homepage "https://www.videolan.org/vlc/"

  livecheck do
    url "https://artifacts.videolan.org/vlc/nightly-macos-#{arch}/"
    regex(/href=.*?vlc[._-]v?(\d+(?:\.\d+)+)[._-]dev[._-]#{livecheck_arch}[._-](\h+)\.dmg/i)
    strategy :page_match do |page, regex|
      directory = page.scan(%r{href=["']?v?(\d+(?:[.-]\d+)+)/?["' >]}i)
                      .flatten
                      .uniq
                      .max
      next if directory.blank?

      # Fetch the directory listing page for newest build
      build_response = Homebrew::Livecheck::Strategy.page_content(
        "https://artifacts.videolan.org/vlc/nightly-macos-#{arch}/#{directory}/",
      )
      next if (build_page = build_response[:content]).blank?

      match = build_page.match(regex)
      next if match.blank?

      "#{match[1]},#{directory},#{match[2]}"
    end
  end

  app "VLC.app", target: "VLCdev.app"

  # shim script (https://github.com/Homebrew/homebrew-cask/issues/18809)
  shimscript = "#{staged_path}/vlcdev.wrapper.sh"
  binary shimscript, target: "vlcdev"

  preflight do
    File.write shimscript, <<~EOS
      #!/bin/sh
      exec '#{appdir}/VLCdev.app/Contents/MacOS/VLC' "$@"
    EOS
  end

  # Maybe this should not be called...
  zap trash: [
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/org.videolan.vlc.sfl*",
    "~/Library/Application Support/org.videolan.vlc",
    "~/Library/Application Support/VLC",
    "~/Library/Caches/org.videolan.vlc",
    "~/Library/Preferences/org.videolan.vlc",
    "~/Library/Preferences/org.videolan.vlc.plist",
    "~/Library/Saved Application State/org.videolan.vlc.savedState",
  ]
end
