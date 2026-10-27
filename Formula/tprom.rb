# typed: false
# frozen_string_literal: true

class Tprom < Formula
  desc "Terminal UI for Prometheus"
  homepage "https://github.com/huseyinbabal/tprom"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/tprom/releases/download/v0.1.0/tprom-aarch64-apple-darwin.tar.gz"
      sha256 "454e533b7d015b6eac7a2acffa5c58419ef782927b2ce3c9f315fedd2d1c5f67"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tprom/releases/download/v0.1.0/tprom-x86_64-apple-darwin.tar.gz"
      sha256 "1b6b3cdb2da4d0f526146154a018b7e61d4e35d83f6a08573ce06373c148ea7c"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/tprom/releases/download/v0.1.0/tprom-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b20256f6b7d848c813ad38657e0fc32682360e54a862ae9c51eb8710b124eb04"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tprom/releases/download/v0.1.0/tprom-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6ffd5fac7a7c9b7765302e0265182e482246b0cc9a591f705713b9226be9a7dd"
    end
  end

  def install
    bin.install "tprom"
  end

  test do
    assert_match "tprom", shell_output("#{bin}/tprom --help")
  end
end
