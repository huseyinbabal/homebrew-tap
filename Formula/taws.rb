# typed: false
# frozen_string_literal: true

class Taws < Formula
  desc "Terminal UI for AWS"
  homepage "https://github.com/huseyinbabal/taws"
  version "1.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.0.1/taws-aarch64-apple-darwin.tar.gz"
      sha256 "bc454a0b133e6d85daf20e310996b967f7063e835f451bfe2f7d5b8f71dd9e86"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.0.1/taws-x86_64-apple-darwin.tar.gz"
      sha256 "273241052f14b574be95ceadf42d756aa2e34edccd2c358754e7e57af13b4fbf"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.0.1/taws-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7dad5d142c0929555373ed6b4274ff47da1c99fa19f52771b7cdf89dc4d24bf5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.0.1/taws-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5a37fdd552f51b3ac0bbb73fdffa4a5658d2ceb6d5b1a4419684e1823cca7027"
    end
  end

  def install
    bin.install "taws"
  end

  test do
    assert_match "taws", shell_output("#{bin}/taws --help")
  end
end
