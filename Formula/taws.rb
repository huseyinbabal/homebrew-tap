# typed: false
# frozen_string_literal: true

class Taws < Formula
  desc "Terminal UI for AWS"
  homepage "https://github.com/huseyinbabal/taws"
  version "1.3.0-rc.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.3.0-rc.6/taws-aarch64-apple-darwin.tar.gz"
      sha256 "c3cb09e6d4c91b44fd299872945a1cf27916a0dcd2307f079c54e400e2d843f1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.3.0-rc.6/taws-x86_64-apple-darwin.tar.gz"
      sha256 "47e3c47380056a0cb02ed54bce6a28e510780ab865f3fa71f517bafba9505b8b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.3.0-rc.6/taws-aarch64-unknown-linux-musl.tar.gz"
      sha256 "06c17c87a7df706c6a04266009ab3011af701a3804cb53069b520947a3e95a38"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.3.0-rc.6/taws-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7dee863ec2783f02aa1f2b456e82040ed2394b4a98879e804ea195d2ccb64a10"
    end
  end

  def install
    bin.install "taws"
  end

  test do
    assert_match "taws", shell_output("#{bin}/taws --help")
  end
end
