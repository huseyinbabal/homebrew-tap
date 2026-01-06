# typed: false
# frozen_string_literal: true

class Tgcp < Formula
  desc "Terminal UI for GCP"
  homepage "https://github.com/huseyinbabal/tgcp"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/tgcp/releases/download/v1.0.0/tgcp-aarch64-apple-darwin.tar.gz"
      sha256 "ebf46bc966995d6d55c78c2befc47015b5b26cea68d83a0871edb21d1bfe21f2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tgcp/releases/download/v1.0.0/tgcp-x86_64-apple-darwin.tar.gz"
      sha256 "d98565105dcf82ab669de2151bff69793e26f38740479b3d02fd449e599b4033"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/tgcp/releases/download/v1.0.0/tgcp-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "65a82f98b15a77b7ab155c94c28f762e0cdebc0e4370621bbc009fb8fa30ab13"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tgcp/releases/download/v1.0.0/tgcp-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "13ff6b1847bf034bdd680089e0b0f143c251b25293a05681a836a2484851aaa9"
    end
  end

  def install
    bin.install "tgcp"
  end

  test do
    assert_match "tgcp", shell_output("#{bin}/tgcp --help")
  end
end
