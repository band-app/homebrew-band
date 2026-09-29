cask "band" do
  version "0.39.0"

  on_arm do
    sha256 "a4a10222102295850f108e6ce3576ee2daf6296d0bce3ea9f16f2e0bbabeb621"

    url "https://github.com/band-app/band/releases/download/v#{version}/Band-#{version}-apple-silicon.dmg"
  end
  on_intel do
    sha256 "4a23573e8e05e1b83724d02a19e7b9e936c4bfdf508f4daf0a217da8f0c88ed0"

    url "https://github.com/band-app/band/releases/download/v#{version}/Band-#{version}-intel.dmg"
  end

  name "Band"
  desc "IDE-agnostic agent orchestrator"
  homepage "https://github.com/band-app/band"

  # Band ships a Squirrel.Mac auto-updater (see the ShipIt entry in the zap
  # trash list below), so the app upgrades itself in place. auto_updates true
  # tells Homebrew not to manage upgrades -- hence no livecheck block, which
  # would only matter if brew upgrade owned the upgrade path.
  auto_updates true
  depends_on macos: :big_sur

  app "Band.app"
  binary "#{appdir}/Band.app/Contents/Resources/binaries/band"

  zap trash: [
    "~/.band",
    "~/Library/Application Support/Band",
    "~/Library/Caches/app.getband.agent",
    "~/Library/Caches/app.getband.agent.ShipIt",
    "~/Library/Logs/Band",
    "~/Library/Preferences/app.getband.agent.plist",
    "~/Library/Saved Application State/app.getband.agent.savedState",
  ]
end
