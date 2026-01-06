# typed: false
# frozen_string_literal: true

class Taws < Formula
  desc "Terminal UI for AWS"
  homepage "https://github.com/huseyinbabal/taws"
  version "1.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.1.1/taws-aarch64-apple-darwin.tar.gz"
      sha256 "86fdbf5d58ebb59bf4a03daf9fdc2c5d6b7dd967b96688ed8992d54a9b7fb744"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.1.1/taws-x86_64-apple-darwin.tar.gz"
      sha256 "d32d02da5fd27f29f215beba7fef2e7aeb3ba5ee3887eb9efec4e68794f3174e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.1.1/taws-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "37505cf85cf6f004784faf291bfce8a85a286a760a7de8df109ee602b3dbfee2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.1.1/taws-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "99190017744988551a1aa3103cfc3f8bde56d8f16100f23ecd6eee6137b72275"
    end
  end

  def install
    bin.install "taws"
  end

  test do
    assert_match "taws", shell_output("#{bin}/taws --help")
  end
end
