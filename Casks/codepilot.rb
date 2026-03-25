cask "codepilot" do
    version "0.39.0"
    sha256 :no_check # Updated by livecheck
  
    # Architecture-specific URLs
    on_intel do
        url "https://github.com/op7418/CodePilot/releases/download/v#{version}/CodePilot-#{version}-x64.dmg"
        sha256 "ae0f0a958e23cd0210bdd187f4013114b82783ba19c8ecd6afb7ad2c178b8306"
    end
    on_arm do
        url "https://github.com/op7418/CodePilot/releases/download/v#{version}/CodePilot-#{version}-arm64.dmg"
        sha256 "160c9f2eb1bb6e28473c9c4a8c16916aabfe78c5a82ef567607cca9eb3670ef6"
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