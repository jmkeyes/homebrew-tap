cask "epson-netconfig" do
  version "4.9.10"
  sha256 "70d865593b63b46bb6ad54aeef587636a6d82c7cd1ccfdd00133238dfeb9ab0f"

  url "https://ftp.epson.com/drivers/ENCU_#{version}.dmg"
  name "epson-netconfig"
  desc "Configuration utility for administrators to configure the network interface"
  homepage "http://www.epson.com/support"

  pkg "EpsonNet_ConfigV4.pkg"

  uninstall pkgutil: "com.epson.pkg.EpsonNet_Config.v4"
end
