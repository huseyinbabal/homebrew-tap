# typed: false
# frozen_string_literal: true

class Tgcp < Formula
  desc "Terminal UI for GCP"
  homepage "https://github.com/huseyinbabal/tgcp"
  version "1.0.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/tgcp/releases/download/v1.0.3/tgcp-aarch64-apple-darwin.tar.gz"
      sha256 "1980874a427ba5633d7b864e0dbc71ddc30a12d7c41a973f5efb5e2f2d849e6b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tgcp/releases/download/v1.0.3/tgcp-x86_64-apple-darwin.tar.gz"
      sha256 "654863f0f6ef4881b01da501bb986d10588eca6a6bb21de1b1ed1d7f0fd489e8"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/tgcp/releases/download/v1.0.3/tgcp-aarch64-unknown-linux-musl.tar.gz"
      sha256 "32c2042ce8264e8f157d1e4f7efd350921a59c3555f9e21ced5e7acfb1daf027"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tgcp/releases/download/v1.0.3/tgcp-x86_64-unknown-linux-musl.tar.gz"
      sha256 "14a41aa02ea5c154447f59a5de63a5da7641b956701ac41f08a2178c16d4edd1"
    end
  end

  def install
    bin.install "tgcp"
  end

  test do
    assert_match "tgcp", shell_output("#{bin}/tgcp --help")
  end
end
