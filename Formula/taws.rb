# typed: false
# frozen_string_literal: true

class Taws < Formula
  desc "Terminal UI for AWS"
  homepage "https://github.com/huseyinbabal/taws"
  version "1.0.2-rc.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.0.2-rc.1/taws-aarch64-apple-darwin.tar.gz"
      sha256 "24a4e05ffcc366f17ddc9bb7880f2f9ad533cb5d0ecd5e62d703f0454b1973cb"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.0.2-rc.1/taws-x86_64-apple-darwin.tar.gz"
      sha256 "d91bb55c121148debfce1b174892c87e22c43142b05c06c84ddaafb8ee1d7dce"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.0.2-rc.1/taws-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6f00670b97304b84ead90bcf15a084e0b3ca949cec88d4e1bb9e9cd2851ce487"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.0.2-rc.1/taws-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "617c19e63ea1d6090752d1b9f6bae88001cfae23616e683755d866271c044e14"
    end
  end

  def install
    bin.install "taws"
  end

  test do
    assert_match "taws", shell_output("#{bin}/taws --help")
  end
end
