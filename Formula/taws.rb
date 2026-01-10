# typed: false
# frozen_string_literal: true

class Taws < Formula
  desc "Terminal UI for AWS"
  homepage "https://github.com/huseyinbabal/taws"
  version "1.1.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.1.6/taws-aarch64-apple-darwin.tar.gz"
      sha256 "dfa97aa6be3263bbbfab4b9865251db70f87f0a2299dfea251294a0bc1cd2dbb"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.1.6/taws-x86_64-apple-darwin.tar.gz"
      sha256 "2ba05d926264e80e6da3e90efd6e9a9a5eddb757510160d85f221db3ef855896"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.1.6/taws-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5470b592cca65801a49a05c733d745f4e62836a3322db371fb31136a7dee74c5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.1.6/taws-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "426b58b8eb9bc2dd3bf8b901ab16d79478f2797dd4ae5ed353f6ddbe656e1bf7"
    end
  end

  def install
    bin.install "taws"
  end

  test do
    assert_match "taws", shell_output("#{bin}/taws --help")
  end
end
