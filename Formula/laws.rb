# typed: false
# frozen_string_literal: true

class Laws < Formula
  desc "Local AWS - a lightweight, fast AWS emulator written in Rust"
  homepage "https://github.com/huseyinbabal/laws"
  version "1.0.0-rc.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/laws/releases/download/v1.0.0-rc.1/laws-aarch64-apple-darwin.tar.gz"
      sha256 "a26de08e28d4e655a9c0a0cba5752842b7b2a8bd3e7f8ed5a503ba4499098a58"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/laws/releases/download/v1.0.0-rc.1/laws-x86_64-apple-darwin.tar.gz"
      sha256 "d24ff5c86cd030981873c3ba3d68d04d3d7bb85f0d98657c7c8df895aa78ace2"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/laws/releases/download/v1.0.0-rc.1/laws-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e04bc946df43edbe4860c96a3247c2b8b3990e11a6659e422b58dd34f3ab3549"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/laws/releases/download/v1.0.0-rc.1/laws-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5277e7a099b73312ef798156112f062db45ed6b363e9a9019318aa4f6b32ddf3"
    end
  end

  def install
    bin.install "laws"
  end

  test do
    assert_match "laws", shell_output("#{bin}/laws --help")
  end
end
