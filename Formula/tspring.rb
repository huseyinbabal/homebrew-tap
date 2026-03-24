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
      sha256 "12520595883427b6642376c2ffdfa412e922391be0addc3466f566f024ea49d9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tsb/releases/download/v1.0.0/tspring-x86_64-apple-darwin.tar.gz"
      sha256 "ecdae3b7b88927ba65f3d26a8476da46db65717b6f9e46ebc572dfaa98c6c571"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/tsb/releases/download/v1.0.0/tspring-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6286674c5176730ac9379be919d06e4f0a9a72ccb8175b5585fed82d19b6511e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tsb/releases/download/v1.0.0/tspring-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e7c66b5cad9e1b43256bae0011002064e101a4160507cd3ede78c8964f39b350"
    end
  end

  def install
    bin.install "tspring"
  end

  test do
    assert_match "tspring", shell_output("#{bin}/tspring --help")
  end
end
