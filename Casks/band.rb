cask "band" do
  version "0.62.0"

  sha256 "639ffecd38a6a4618b3f2af2ddced47fbde85a41ab18998ca316b80752080a0e"

  url "https://github.com/band-app/band/releases/download/v#{version}/Band-#{version}-apple-silicon.dmg"

  name "Band"
  desc "IDE-agnostic agent orchestrator"
  homepage "https://github.com/band-app/band"

  # Band ships a Squirrel.Mac auto-updater (see the ShipIt entry in the zap
  # trash list below), so the app upgrades itself in place. auto_updates true
  # tells Homebrew not to manage upgrades -- hence no livecheck block, which
  # would only matter if brew upgrade owned the upgrade path.
  auto_updates true
  depends_on arch: :arm64
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
