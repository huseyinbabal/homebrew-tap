# typed: false
# frozen_string_literal: true

class Taws < Formula
  desc "Terminal UI for AWS"
  homepage "https://github.com/huseyinbabal/taws"
  version "1.1.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.1.5/taws-aarch64-apple-darwin.tar.gz"
      sha256 "c1c04d398c7de635076bdcaf57926a59c4e0a4500122d94bdf3ba727352cb268"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.1.5/taws-x86_64-apple-darwin.tar.gz"
      sha256 "22b56661402648569a65f40fe0c7565738b66d83df458cf73c2e715cf0f53ac4"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.1.5/taws-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f3970da6c3e43977099709bdf707a9130472c3b75c18f67e30a1d115e8f64f74"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.1.5/taws-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "54860bb709b279c661a2a93ef63be7229c0c07313f57165e7c0b06759c82eaf8"
    end
  end

  def install
    bin.install "taws"
  end

  test do
    assert_match "taws", shell_output("#{bin}/taws --help")
  end
end
