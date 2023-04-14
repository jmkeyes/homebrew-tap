class Mp4Merge < Formula
  desc "Losslessly join MP4 files shot with same camera and settings"
  homepage "https://github.com/gyroflow/mp4-merge"
  url "https://github.com/gyroflow/mp4-merge/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "e79dc225b05d76afcbe8e04f7c4ced90c54469a4b55be2f1416a75ea61a339a1"
  license any_of: ["Apache-2.0", "MIT"]

  head "https://github.com/gyroflow/mp4-merge.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end
end
