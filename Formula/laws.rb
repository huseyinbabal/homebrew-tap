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
      sha256 "decaba58ab2a1b1917a63ef0c97614987e5b1356b2105e2822ed834435e591b3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/laws/releases/download/v1.2.0/laws-x86_64-apple-darwin.tar.gz"
      sha256 "ffec653bbc93c0755562830f3d95e334e7bd8ce5326e996adbcabb46debd1949"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/laws/releases/download/v1.2.0/laws-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c8e93af0dc575e7fc9262283f0b0f1621353417af7e31bed5a9f77d459d2aa7d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/laws/releases/download/v1.2.0/laws-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8d66f42e3be8fe4f08ff7dc260f8e93fe9a0095515de8d02d69c03a60dbf4a5c"
    end
  end

  def install
    bin.install "laws"
  end

  test do
    assert_match "laws", shell_output("#{bin}/laws --help")
  end
end
