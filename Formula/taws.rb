# typed: false
# frozen_string_literal: true

class Taws < Formula
  desc "Terminal UI for AWS"
  homepage "https://github.com/huseyinbabal/taws"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.2.0/taws-aarch64-apple-darwin.tar.gz"
      sha256 "876fa1daa088e4742443066d6dac78b3e88db53d3acf63014ed7666a2b3bb3cb"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.2.0/taws-x86_64-apple-darwin.tar.gz"
      sha256 "af2eb05c1289012291de0c9f3293409c16882582513c6f06b0c5a5952db1cb18"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.2.0/taws-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e4b0e4d6fafc7e0d8b51d2d4ce07112af34890e4974005decc643b45db4f8b72"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.2.0/taws-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e53eed9b44ba257ddef44b81a5f1dc1e3e312b8339b9e68b9981c00d802019f8"
    end
  end

  def install
    bin.install "taws"
  end

  test do
    assert_match "taws", shell_output("#{bin}/taws --help")
  end
end
