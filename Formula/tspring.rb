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
      sha256 "e44bd697c75c36845a63f35f059f317f96374f4318ccd6b012cfd3aad688dc6e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tsb/releases/download/v1.0.0/tspring-x86_64-apple-darwin.tar.gz"
      sha256 "406ca96b27e08b97441091b9f2fe71344507a8fc0e8f3d6e203c5af2545bc4ba"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/tsb/releases/download/v1.0.0/tspring-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6a04b1031836e8d78cda5e72f8dbba72607f165b04b9283f02d060bb687388f2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tsb/releases/download/v1.0.0/tspring-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8d60aa79695b71cbe0b613a161ef3007836c1c034a6a09245cac4a87fcc5bf3a"
    end
  end

  def install
    bin.install "tspring"
  end

  test do
    assert_match "tspring", shell_output("#{bin}/tspring --help")
  end
end
