# typed: false
# frozen_string_literal: true

class Tgcp < Formula
  desc "Terminal UI for GCP"
  homepage "https://github.com/huseyinbabal/tgcp"
  version "1.0.0-rc.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/tgcp/releases/download/v1.0.0-rc.2/tgcp-aarch64-apple-darwin.tar.gz"
      sha256 "552a91379c6635c5883dbfda87d033d61b299c4995906953463dd2b81382818c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tgcp/releases/download/v1.0.0-rc.2/tgcp-x86_64-apple-darwin.tar.gz"
      sha256 "2f2914b9d21f8a5486c83926a1b5cdf6e5fb4cb9c6ca5b8dd159801a86cf14ec"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/tgcp/releases/download/v1.0.0-rc.2/tgcp-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ad47f5041908b0a1f7d1480aa5a07adc4c0e25bc93c9d6a627d223685be47780"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tgcp/releases/download/v1.0.0-rc.2/tgcp-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a9ba171f574a1fb3aa1f00cf45d93925570277335fe1781b6e305528254333f9"
    end
  end

  def install
    bin.install "tgcp"
  end

  test do
    assert_match "tgcp", shell_output("#{bin}/tgcp --help")
  end
end
