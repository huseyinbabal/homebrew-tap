# typed: false
# frozen_string_literal: true

class Tgcp < Formula
  desc "Terminal UI for GCP"
  homepage "https://github.com/huseyinbabal/tgcp"
  version "1.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/tgcp/releases/download/v1.0.2/tgcp-aarch64-apple-darwin.tar.gz"
      sha256 "3e4ed134536cf5b20fc883626e85f692263ce4c4ca6a00a700d28de71c1d5128"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tgcp/releases/download/v1.0.2/tgcp-x86_64-apple-darwin.tar.gz"
      sha256 "8060afe05f1270bf5a545724a146ccc3f6901f067aa514cdb6bd4e1307145b6c"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/tgcp/releases/download/v1.0.2/tgcp-aarch64-unknown-linux-musl.tar.gz"
      sha256 "cc8c14769e208aa541b995eaea07e10d81deb40a92df01c27f1a5e7c325d24fb"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tgcp/releases/download/v1.0.2/tgcp-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9d2a6709bd9202aa99ff24cd5dd1b951bb959c115af1b0c5c18f0545e7629432"
    end
  end

  def install
    bin.install "tgcp"
  end

  test do
    assert_match "tgcp", shell_output("#{bin}/tgcp --help")
  end
end
