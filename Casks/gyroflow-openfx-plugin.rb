cask "gyroflow-openfx-plugin" do
  version "1.1"
  sha256 "f1305906ffe2ee70906ea2c5e4072d799670056fe7bdf14c493037eec04a4313"

  url "https://github.com/gyroflow/gyroflow-ofx/releases/download/v#{version}/gyroflow-ofx-macosx.dmg",
      verified: "github.com/gyroflow/gyroflow-ofx/"
  name "Gyroflow OpenFX Plugin"
  desc "OpenFX plugin for Gyroflow video stabilization"
  homepage "https://gyroflow.xyz/"

  depends_on macos: ">= :mojave"

  artifact "Gyroflow.ofx.bundle", target: "/Library/OFX/Plugins/Gyroflow.ofx.bundle"
end
