cask "codepilot" do
  version "0.62.0"

  on_arm do
    sha256 "7dd7a06a08dba96427d899fcb2224812416df179507424d563e7d5649fe4c048"

    url "https://github.com/op7418/CodePilot/releases/download/v#{version}/CodePilot-#{version}-arm64.dmg"
  end
  # Architecture-specific URLs
  on_intel do
    sha256 "613fc54fc98acb33f08e2ae9bca021b16f81e26d81209d5cea2a292f498deb27"

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
