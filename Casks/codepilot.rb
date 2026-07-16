cask "codepilot" do
  version "0.58.0"

  on_arm do
    sha256 "9a4e63ed7a48051c30a8a9f8a822fc1059eec444f2e1069e8bfb51b64bd3ca73"

    url "https://github.com/op7418/CodePilot/releases/download/v#{version}/CodePilot-#{version}-arm64.dmg"
  end
  # Architecture-specific URLs
  on_intel do
    sha256 "44b4e9c4d77ea7834839b1acfd7bf4dd658a43c095faacaa6f0a42cc6a6665ec"

    url "https://github.com/op7418/CodePilot/releases/download/v#{version}/CodePilot-#{version}-x64.dmg"
  end

  name "CodePilot"
  desc "Desktop GUI for Claude Code — chat, code, and manage projects visually"
  homepage "https://github.com/op7418/CodePilot/"

  # Livecheck ensures we find the latest version from GitHub releases
  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "CodePilot.app"
end
