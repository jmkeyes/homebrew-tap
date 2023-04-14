cask "reelsteady-joiner" do
  version "1.3.1"
  sha256 "ebf47dbe36cc2e14e9787ae4bba51cc6844340c28ba3868c3e1498970bbb72b4"

  url "https://github.com/rubegartor/ReelSteady-Joiner/releases/download/#{version}/ReelSteady.Joiner-setup-#{version}-mac-x64.pkg"
  name "reelsteady-joiner"
  desc "Merges GoPro video files without losing gyro data"
  homepage "https://github.com/rubegartor/ReelSteady-Joiner"

  pkg "ReelSteady.Joiner-setup-#{version}-mac-x64.pkg", allow_untrusted: true

  uninstall pkgutil: "org.rubegartor.reelsteady-joiner"
end
