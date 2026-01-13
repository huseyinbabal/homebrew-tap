# typed: false
# frozen_string_literal: true

class Taws < Formula
  desc "Terminal UI for AWS"
  homepage "https://github.com/huseyinbabal/taws"
  version "1.1.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.1.7/taws-aarch64-apple-darwin.tar.gz"
      sha256 "b13812906b89bbc4fc574fea7be599357a46ff22a4ba9632b7bd98a83540fc35"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.1.7/taws-x86_64-apple-darwin.tar.gz"
      sha256 "1c2ba1fb1f07cf81654d420fae0d6e00588246794f5b7aa15b3794839820fd24"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.1.7/taws-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d18b8f07c70022c7b5efd9734e430bf4d5a6ae6d74c1dacf939ab067cdd33c89"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.1.7/taws-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9f9817c10e8739f9c6609d19a1d16f3d2c2d7a4e742d7daa527077c340ba11de"
    end
  end

  def install
    bin.install "taws"
  end

  test do
    assert_match "taws", shell_output("#{bin}/taws --help")
  end
end
