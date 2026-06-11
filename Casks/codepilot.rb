cask "codepilot" do
    version "0.56.0"

    # Architecture-specific URLs
    on_intel do
        url "https://github.com/op7418/CodePilot/releases/download/v#{version}/CodePilot-#{version}-x64.dmg"
        sha256 "294ab5d6551a9c042459ef07ce00788719740474f366b3c683bc98adf97c840f"
    end
    on_arm do
        url "https://github.com/op7418/CodePilot/releases/download/v#{version}/CodePilot-#{version}-arm64.dmg"
        sha256 "623573cb5961288acf3793a5067725b0f37f5faf00ab4041170486e59178045f"
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