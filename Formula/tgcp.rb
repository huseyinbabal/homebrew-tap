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
      sha256 "b7c98e4fb57e96976d44918db22aad8a0cc164707249595813566288fdbd7660"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tgcp/releases/download/v1.0.0/tgcp-x86_64-apple-darwin.tar.gz"
      sha256 "261b8facce99c16d73577c6d31bf87d1f8f87186da3abebfa99152afa46e422c"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/tgcp/releases/download/v1.0.0/tgcp-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9b48765a2f907f55f5e5136f4f67defed189680509533f84b006501bf06ec6f4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tgcp/releases/download/v1.0.0/tgcp-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b6fe69baa68dcb9d968d299df14d4b3695bea6af9674b61a823b098f69768165"
    end
  end

  def install
    bin.install "tgcp"
  end

  test do
    assert_match "tgcp", shell_output("#{bin}/tgcp --help")
  end
end
