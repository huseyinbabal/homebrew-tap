# typed: false
# frozen_string_literal: true

class Tredis < Formula
  desc "Terminal UI for Redis"
  homepage "https://github.com/huseyinbabal/tredis"
  version ""
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/tredis/releases/download/v/tredis-aarch64-apple-darwin.tar.gz"
      sha256 "42b0e0aca54333f9be9d5b8867ecd6aea8d29065c31c6702e5ee0d5c14e1484b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tredis/releases/download/v/tredis-x86_64-apple-darwin.tar.gz"
      sha256 "816d92167fba20508bd7ca8e43e293ce3793474e6a79e22dc0e266f42dcd59c1"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/tredis/releases/download/v/tredis-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1993ffa0bb9a3f37eac947b487431384b415a23a2cd2bb0ce8a6532f1a44efae"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tredis/releases/download/v/tredis-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f0f344cc3a664156c63d7af5f0edf815341d4714c2b44fc5da815b0a28f11cd9"
    end
  end

  def install
    bin.install "tredis"
  end

  test do
    assert_match "tredis", shell_output("#{bin}/tredis --help")
  end
end
