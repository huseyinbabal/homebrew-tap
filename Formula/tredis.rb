# typed: false
# frozen_string_literal: true

class Tredis < Formula
  desc "Terminal UI for Redis"
  homepage "https://github.com/huseyinbabal/tredis"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/tredis/releases/download/v1.1.0/tredis-aarch64-apple-darwin.tar.gz"
      sha256 "8d4335b5ab4414d312f1bf675d77ff0e2f3e5a2b018723899437674409ae4048"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tredis/releases/download/v1.1.0/tredis-x86_64-apple-darwin.tar.gz"
      sha256 "db1cdaa1d7424ef592fdc186e885b448693e5983ea8a0f1bbf756e6f8a9234a7"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/tredis/releases/download/v1.1.0/tredis-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "38f9d0b217be9904e08380a9cb5d1965759c1bf152f873bc4e0a4425e6d1010b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tredis/releases/download/v1.1.0/tredis-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "aefc51c1b26a9e9779575751a73eab64068cce9e8d95c895761eff1cc8e4adfd"
    end
  end

  def install
    bin.install "tredis"
  end

  test do
    assert_match "tredis", shell_output("#{bin}/tredis --help")
  end
end
