cask "codepilot" do
  version "0.64.0"

  on_macos do
    on_arm do
      sha256 "6cc3c00da7bb9ef639c3d48a80a04fc4ef986ccfb72456fcfedaa1ed40c99662"
      url "https://github.com/op7418/CodePilot/releases/download/v#{version}/CodePilot-#{version}-arm64.dmg"
    end
    on_intel do
      sha256 "85a58fd4f24dabe7f0962523dac2d5124995d3871dca8f8b799bdffa4ac7568c"
      url "https://github.com/op7418/CodePilot/releases/download/v#{version}/CodePilot-#{version}-x64.dmg"
    end

    depends_on macos: :monterey

    app "CodePilot.app"
  end
  on_linux do
    on_arm do
      sha256 "e4f6ad3e8a85d6af303a59d984438c17e7f209e8a05a349d7395718a9fea9d5b"
      url "https://github.com/op7418/CodePilot/releases/download/v#{version}/CodePilot-#{version}-arm64.AppImage"
      appimage "CodePilot-#{version}-arm64.AppImage", target: "codepilot"
    end
    on_intel do
      sha256 "cc4e2eb2cdf22cd6b5fae5e0f17da2a077def62d16f2808cafe87619a5436ad2"
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
