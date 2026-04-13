cask "codepilot" do
    version "0.49.0"

    # Architecture-specific URLs
    on_intel do
        url "https://github.com/op7418/CodePilot/releases/download/v#{version}/CodePilot-#{version}-x64.dmg"
        sha256 "83d61ed62f238f67ed44b1d4021d1b752ecb11976d27cda107e43f1560c39094"
    end
    on_arm do
        url "https://github.com/op7418/CodePilot/releases/download/v#{version}/CodePilot-#{version}-arm64.dmg"
        sha256 "5594a8c5e168aa8815d56da6ae8f611565a32d123a2f0d3a2ecc4f7eb09d33e3"
    end

    name "CodePilot"
    desc "A desktop GUI for Claude Code — chat, code, and manage projects visually"
    homepage "https://github.com/op7418/CodePilot/"

    # Livecheck ensures we find the latest version from GitHub releases
    livecheck do
        url :url
        strategy :github_latest
    end

    app "CodePilot.app"
  end