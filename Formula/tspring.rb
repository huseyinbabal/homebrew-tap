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
      sha256 "e702103942b40a4285629ed74b42935170522b22d63336a343042bf4576df31e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tsb/releases/download/v1.0.0/tspring-x86_64-apple-darwin.tar.gz"
      sha256 "494de57ad73e82ba52576566c70ed7bd7aba351aebb4d0a59f4b1c404720c0fe"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/tsb/releases/download/v1.0.0/tspring-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2f93788fc91de931d3f1bbf14b46774958a11a84e1d778d2cde8e0bf550a5232"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tsb/releases/download/v1.0.0/tspring-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3b2826dcd6691dcf8aabeaa304c6ac4f331ff30c6c81883be9de72d5b76594ac"
    end
  end

  def install
    bin.install "tspring"
  end

  test do
    assert_match "tspring", shell_output("#{bin}/tspring --help")
  end
end
