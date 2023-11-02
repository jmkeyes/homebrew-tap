cask "gyroflow-openfx-plugin" do
  version "1.3.0"
  sha256 "4f364d634029bba72eadb6245cd22f4cb40627eded2eb41c3ef573308774d6ea"

  url "https://github.com/gyroflow/gyroflow-ofx/releases/download/v#{version}/gyroflow-ofx-macosx.dmg",
      verified: "github.com/gyroflow/gyroflow-ofx/"
  name "Gyroflow OpenFX Plugin"
  desc "OpenFX plugin for Gyroflow video stabilization"
  homepage "https://gyroflow.xyz/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :mojave"

  artifact "Gyroflow.ofx.bundle", target: "/Library/OFX/Plugins/Gyroflow.ofx.bundle"
end
