# typed: false
# frozen_string_literal: true

class Laws < Formula
  desc "Local AWS - a lightweight, fast AWS emulator written in Rust"
  homepage "https://github.com/huseyinbabal/laws"
  version "1.0.0-rc.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/laws/releases/download/v1.0.0-rc.3/laws-aarch64-apple-darwin.tar.gz"
      sha256 "c02512db48f7df5d691aff1c142796f8a929af03e266b8143138c0f9afc75078"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/laws/releases/download/v1.0.0-rc.3/laws-x86_64-apple-darwin.tar.gz"
      sha256 "127c6f76abb701b64ef06a4a04a3faaf91782613b06aaa167bf7aee51df3677f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/laws/releases/download/v1.0.0-rc.3/laws-aarch64-unknown-linux-musl.tar.gz"
      sha256 "fed08290c72f7bb00095ab4f1a31a12d92c3258329443847a4d33ac470e6b8af"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/laws/releases/download/v1.0.0-rc.3/laws-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0cc2a70eb9cc701e7ad80294fac80125de1070d99e9931334b943054e208441d"
    end
  end

  def install
    bin.install "laws"
  end

  test do
    assert_match "laws", shell_output("#{bin}/laws --help")
  end
end
