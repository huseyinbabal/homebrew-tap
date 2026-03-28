# typed: false
# frozen_string_literal: true

class Laws < Formula
  desc "Local AWS - a lightweight, fast AWS emulator written in Rust"
  homepage "https://github.com/huseyinbabal/laws"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/laws/releases/download/v1.1.0/laws-aarch64-apple-darwin.tar.gz"
      sha256 "8455e1a6ec37bc637469103c60a7cb4cc1354b9c602fafa47869367ba17d12ff"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/laws/releases/download/v1.1.0/laws-x86_64-apple-darwin.tar.gz"
      sha256 "7becf6867ae074e92ace48b22d7ed0b2426d32c4afb220fa06e12fe59a90c4b1"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/laws/releases/download/v1.1.0/laws-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c74447dbc569bc7fd8060cfafa5cbc6ffca11b9698e969923702a8bdb1ecbc3f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/laws/releases/download/v1.1.0/laws-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e17c1eb877a46d48306711cf42318c2b70caedf9cc0ebb6a6b5bf02bb8737917"
    end
  end

  def install
    bin.install "laws"
  end

  test do
    assert_match "laws", shell_output("#{bin}/laws --help")
  end
end
