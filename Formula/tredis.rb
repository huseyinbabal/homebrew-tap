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
      sha256 "c485d5decadbe24ecb171545907281be6b390f5d4c88f92bea9c9f6656731c14"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tredis/releases/download/v/tredis-x86_64-apple-darwin.tar.gz"
      sha256 "82bce6581ab4f563f5c455f33da9b2e1c201b565f4cdcb533f93fce3d6d6949d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/tredis/releases/download/v/tredis-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6a0ba85fb0d52a2e856c2118a414c3c37a34b190a8080843c88ca7aa385013db"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tredis/releases/download/v/tredis-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fedd75d6dbe2181de0f9c45c5da626300e212ddf9e4f5b26f4bd8feae4f6d2e5"
    end
  end

  def install
    bin.install "tredis"
  end

  test do
    assert_match "tredis", shell_output("#{bin}/tredis --help")
  end
end
