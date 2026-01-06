# typed: false
# frozen_string_literal: true

class Tgcp < Formula
  desc "Terminal UI for GCP"
  homepage "https://github.com/huseyinbabal/tgcp"
  version "1.0.0-rc.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/tgcp/releases/download/v1.0.0-rc.1/tgcp-aarch64-apple-darwin.tar.gz"
      sha256 "cc851067ef1c94390794e8ecf230f15eacdabd52274fbcd3576b7798acd5eb2f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tgcp/releases/download/v1.0.0-rc.1/tgcp-x86_64-apple-darwin.tar.gz"
      sha256 "06f42b54c7526f20e0a553a1454267b69be7da8c1ac10c580bda3c0803da693b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/tgcp/releases/download/v1.0.0-rc.1/tgcp-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "54cb04e36f3b4dcf3ff4fc820800142b81e6403dc251e4866bb53321782b7bbd"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tgcp/releases/download/v1.0.0-rc.1/tgcp-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7be06952fcb2b8c92d2be7d37d79d8ba10c39c6f861b6a25a6b1f052a45e4924"
    end
  end

  def install
    bin.install "tgcp"
  end

  test do
    assert_match "tgcp", shell_output("#{bin}/tgcp --help")
  end
end
