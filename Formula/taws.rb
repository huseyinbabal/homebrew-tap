# typed: false
# frozen_string_literal: true

class Taws < Formula
  desc "Terminal UI for AWS"
  homepage "https://github.com/huseyinbabal/taws"
  version "1.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.1.3/taws-aarch64-apple-darwin.tar.gz"
      sha256 "0164fbf739cc1e7922ce8dfee0fa06f6dd498c5715a8b3db7ed1077d1877ab09"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.1.3/taws-x86_64-apple-darwin.tar.gz"
      sha256 "ce95a353b1b0f1aea9233da25755293fe882da99e1c765ab963e9e1558552862"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.1.3/taws-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "890d8bd014a7cbb37814a19790997fa852dcfa3bf08e0ac5060eae9f3a893e63"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.1.3/taws-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2a536be1bee0d9c2061e700001b804ce1d5c30acee0a1115f3464ecddcddcba9"
    end
  end

  def install
    bin.install "taws"
  end

  test do
    assert_match "taws", shell_output("#{bin}/taws --help")
  end
end
