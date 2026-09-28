cask "band" do
  version "0.34.0"

  on_arm do
    sha256 "9402cab9088df1fb3f5594f2ae88804e2308c82c55041d0698d5f8e4d38c566e"

    url "https://github.com/band-app/band/releases/download/v#{version}/Band-#{version}-apple-silicon.dmg"
  end
  on_intel do
    sha256 "ef5cc2a05e74d0e6267e264063951fee916f2f58b8816115b9214cf30f47d520"

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
