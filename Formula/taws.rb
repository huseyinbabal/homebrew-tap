# typed: false
# frozen_string_literal: true

class Taws < Formula
  desc "Terminal UI for AWS"
  homepage "https://github.com/huseyinbabal/taws"
  version "1.1.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.1.7/taws-aarch64-apple-darwin.tar.gz"
      sha256 "4a7c3454ca7997d17ec1e6ecaa3df93bb647af95ace7843325dfd33473789724"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.1.7/taws-x86_64-apple-darwin.tar.gz"
      sha256 "d4b040a599d637134824a04275bf042c8d41233f6e0609ab59189bf0dacfd5c4"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.1.7/taws-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3bf28b88318f20317beb78d7d3f7be8042759a09ba98116d54c7db88f675e5c0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.1.7/taws-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6b43bff6065f28b048259f48c7b72e37758c55e7dbe692da672dca1c598c9682"
    end
  end

  def install
    bin.install "taws"
  end

  test do
    assert_match "taws", shell_output("#{bin}/taws --help")
  end
end
