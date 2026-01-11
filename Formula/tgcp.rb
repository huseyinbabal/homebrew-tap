# typed: false
# frozen_string_literal: true

class Tgcp < Formula
  desc "Terminal UI for GCP"
  homepage "https://github.com/huseyinbabal/tgcp"
  version "1.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/tgcp/releases/download/v1.0.1/tgcp-aarch64-apple-darwin.tar.gz"
      sha256 "c49da00ccd3d23e733afd55cb7b4d76e88eaa6c047a75444ec4c4ce838c09381"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tgcp/releases/download/v1.0.1/tgcp-x86_64-apple-darwin.tar.gz"
      sha256 "92b7177c5c9ec69f966a4d194d30cab381c4e2caf110944272d09a09803a06d9"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/tgcp/releases/download/v1.0.1/tgcp-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dcbf7e08cd507cffc7d901ab4813a3e229b6ba1856a61d03f94f6440dcc5ddd8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tgcp/releases/download/v1.0.1/tgcp-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "240173df0fe9b81a85115cc31bf0d7f22e5cca128bc8eab6bba0dfb8d0233bc7"
    end
  end

  def install
    bin.install "tgcp"
  end

  test do
    assert_match "tgcp", shell_output("#{bin}/tgcp --help")
  end
end
