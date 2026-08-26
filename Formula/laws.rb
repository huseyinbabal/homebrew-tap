# typed: false
# frozen_string_literal: true

class Laws < Formula
  desc "Local AWS - a lightweight, fast AWS emulator written in Rust"
  homepage "https://github.com/huseyinbabal/laws"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/laws/releases/download/v1.2.0/laws-aarch64-apple-darwin.tar.gz"
      sha256 "c8b48882d752f90c2111da508a5dff74b2b359b285cf32413f2e948383beb97e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/laws/releases/download/v1.2.0/laws-x86_64-apple-darwin.tar.gz"
      sha256 "ea805482a2c4a5581d1531477726cafd84952795e2c067c737bcefc1c38bfacd"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/laws/releases/download/v1.2.0/laws-aarch64-unknown-linux-musl.tar.gz"
      sha256 "914ddcf22d755bbad299f62fa1e1393b42957c0bcb0026ffef1b9dfd9b9620ab"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/laws/releases/download/v1.2.0/laws-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0179dfe7bd456424b381101e2b278329446edcedd8af918cc2b1dc5379bafa75"
    end
  end

  def install
    bin.install "laws"
  end

  test do
    assert_match "laws", shell_output("#{bin}/laws --help")
  end
end
