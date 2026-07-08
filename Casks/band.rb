cask "band" do
  version "0.27.0"

  on_arm do
    sha256 "c2057a27d67ccf7f4fad703a942d01b69a5075f05e5d495325cd3dc7dd01cb1a"

    url "https://github.com/band-app/band/releases/download/v#{version}/Band-#{version}-apple-silicon.dmg"
  end
  on_intel do
    sha256 "8cd44b5dd518cfbd632b5dd3e918ce467524e89ccab058ac97f49e29b20a1875"

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
