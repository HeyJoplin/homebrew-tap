cask "codepilot" do
    version "0.43.1"

    # Architecture-specific URLs
    on_intel do
        url "https://github.com/op7418/CodePilot/releases/download/v#{version}/CodePilot-#{version}-x64.dmg"
        sha256 "1639f4747ba82a9f42f604f59f3623a9ac331dd8dba8e4962c740500e8f6dfc5"
    end
    on_arm do
        url "https://github.com/op7418/CodePilot/releases/download/v#{version}/CodePilot-#{version}-arm64.dmg"
        sha256 "e236e98daef448a589c8bd36e203eda45af15bed5cafea238aa54aa48a75f7db"
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