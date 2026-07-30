cask "codepilot" do
  version "0.61.0"

  on_arm do
    sha256 "b6ef5a031600eb3322fc2bdfff8be703cb05f8c83e23836927c372d1cc4efcb0"

    url "https://github.com/op7418/CodePilot/releases/download/v#{version}/CodePilot-#{version}-arm64.dmg"
  end
  # Architecture-specific URLs
  on_intel do
    sha256 "ae40c90fd4e71f1cc45daa77f38c7a085e0b49ba1d96380ee735f263737725ca"

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
