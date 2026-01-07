# typed: false
# frozen_string_literal: true

class Taws < Formula
  desc "Terminal UI for AWS"
  homepage "https://github.com/huseyinbabal/taws"
  version "1.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.1.2/taws-aarch64-apple-darwin.tar.gz"
      sha256 "d0dc6639065f0a8b0ef60372cb4145d7c508b7b4c31deb1bf1cf7140f7eae721"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.1.2/taws-x86_64-apple-darwin.tar.gz"
      sha256 "c3d326d96732af9623510a493bcdfa898f407a0a27548caa198c2b11f9638be2"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.1.2/taws-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2ff791d4addd3be24cb8e2cc35505c896fb2d855f9e8e58907e1b65d5f552fec"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.1.2/taws-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "858d3448c0c04eea8096b939ebbf0a9c757d79b0831eba819bc54f406f112902"
    end
  end

  def install
    bin.install "taws"
  end

  test do
    assert_match "taws", shell_output("#{bin}/taws --help")
  end
end
