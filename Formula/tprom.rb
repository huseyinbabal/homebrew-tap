# typed: false
# frozen_string_literal: true

class Tprom < Formula
  desc "Terminal UI for Prometheus"
  homepage "https://github.com/huseyinbabal/tprom"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/tprom/releases/download/v0.2.0/tprom-aarch64-apple-darwin.tar.gz"
      sha256 "e6ffd1da1033a67e2251eec3b749d553f5470192fe16ed3475cb8c177a18c047"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tprom/releases/download/v0.2.0/tprom-x86_64-apple-darwin.tar.gz"
      sha256 "f67d09d0aeac2d9837d56d0f591609b2e198e221fccf25b9d9225639be57da9d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/tprom/releases/download/v0.2.0/tprom-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3adf04021f9dc973bfb0a76fba6441380ccc23a62ff0b4e15235d0a01625c843"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tprom/releases/download/v0.2.0/tprom-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d55e88e458cd1a75e6a32a45362a684510c7245619a284a3879a058fb7c960d2"
    end
  end

  def install
    bin.install "tprom"
  end

  test do
    assert_match "tprom", shell_output("#{bin}/tprom --help")
  end
end
