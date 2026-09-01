cask "codepilot" do
  version "0.67.11"

  on_macos do
    on_arm do
      sha256 "a5c390e6cd369e775ed043b9c727a30f439096501341e0cbadb46d99afff6185"
      url "https://github.com/op7418/CodePilot/releases/download/v#{version}/CodePilot-#{version}-arm64.dmg"
    end
    on_intel do
      sha256 "c95f8c3f3c71d380be6f96f8c6bdc9bd704276dcdd65c8ba7bc02c86bca9f72f"
      url "https://github.com/op7418/CodePilot/releases/download/v#{version}/CodePilot-#{version}-x64.dmg"
    end

    depends_on macos: :monterey

    app "CodePilot.app"
  end
  on_linux do
    on_arm do
      sha256 "ca54aa0ea4df0c2478d945d08ad613dd9a7cae3286945a4735f5121738ce62c1"
      url "https://github.com/op7418/CodePilot/releases/download/v#{version}/CodePilot-#{version}-arm64.AppImage"
      appimage "CodePilot-#{version}-arm64.AppImage", target: "codepilot"
    end
    on_intel do
      sha256 "688278cc20e0c8dc7fb1b865a0434ce3fc12406d39995569a8f0a8f648b0c779"
      url "https://github.com/op7418/CodePilot/releases/download/v#{version}/CodePilot-#{version}-x86_64.AppImage"
      appimage "CodePilot-#{version}-x86_64.AppImage", target: "codepilot"
    end

    binary "CodePilot"
  end

  name "CodePilot"
  desc "Desktop GUI for Claude Code — chat, code, and manage projects visually"
  homepage "https://github.com/op7418/CodePilot/"

  # Livecheck ensures we find the latest version from GitHub releases
  livecheck do
    url :url
    strategy :github_latest
  end
end
