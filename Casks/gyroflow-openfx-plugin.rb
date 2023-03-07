cask "gyroflow-openfx-plugin" do
  version "1.0.11"
  sha256 "05e2a9983e10cd8fb804ac33dd7b591da89b8505e50119b55d87b8e9d931e743"

  url "https://github.com/gyroflow/gyroflow-ofx/releases/download/v#{version}/gyroflow-ofx-macosx.dmg",
      verified: "github.com/gyroflow/gyroflow-ofx/"
  name "Gyroflow OpenFX Plugin"
  desc "OpenFX plugin for Gyroflow video stabilization"
  homepage "https://gyroflow.xyz/"

  depends_on macos: ">= :mojave"

  artifact "Gyroflow.ofx.bundle", target: "/Library/OFX/Plugins/Gyroflow.ofx.bundle"
end
