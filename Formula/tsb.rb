# typed: false
# frozen_string_literal: true

class Tsb < Formula
  desc "Terminal UI for Spring Boot - A modern TUI for managing Spring Boot applications"
  homepage "https://github.com/huseyinbabal/tsb"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/tsb/releases/download/v1.0.0/tsb-aarch64-apple-darwin.tar.gz"
      sha256 "995d25e1a46da9aa571e405514e2f5b70ea84b9caef9f534f9909604f2f6889e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tsb/releases/download/v1.0.0/tsb-x86_64-apple-darwin.tar.gz"
      sha256 "07f5ee1e4317d67bd63dadc0c3a4fefebd335fc4a9f6e472afcdbe07caa23287"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/tsb/releases/download/v1.0.0/tsb-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3e1023d0af688e6b2cbe3e10554dacff4389fdcbbfc05a308c7e69f19d6b18be"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tsb/releases/download/v1.0.0/tsb-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a7fcb310a12e8a1dc21a09b1c9d7cc828f5fd6b88e033370c3cd712b695960e9"
    end
  end

  def install
    bin.install "tsb"
  end

  test do
    assert_match "tsb", shell_output("#{bin}/tsb --help")
  end
end
