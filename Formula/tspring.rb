# typed: false
# frozen_string_literal: true

class Tspring < Formula
  desc "Terminal UI for Spring Boot - A modern TUI for managing Spring Boot applications"
  homepage "https://github.com/huseyinbabal/tsb"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/tsb/releases/download/v1.0.0/tspring-aarch64-apple-darwin.tar.gz"
      sha256 "05edd647c17c1f58d4c3f94dd0a5510c41d500622cc09984a1c77d9905d2e6ff"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tsb/releases/download/v1.0.0/tspring-x86_64-apple-darwin.tar.gz"
      sha256 "8fbf52e925173723e82a9246692a00698bd6069f279f052332588317a610d9ea"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/tsb/releases/download/v1.0.0/tspring-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f218b7d2293028705ba2d90bf8438dc5fd3d273a7e7528b03e22aee5dbb9a113"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tsb/releases/download/v1.0.0/tspring-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7de3343291250ece71ea415a9369f195ec2c7ab1983ec456cf604b51f771821e"
    end
  end

  def install
    bin.install "tspring"
  end

  test do
    assert_match "tspring", shell_output("#{bin}/tspring --help")
  end
end
