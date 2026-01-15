# typed: false
# frozen_string_literal: true

class Taws < Formula
  desc "Terminal UI for AWS"
  homepage "https://github.com/huseyinbabal/taws"
  version "1.2.0-rc.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.2.0-rc.2/taws-aarch64-apple-darwin.tar.gz"
      sha256 "d7025e37eadfee8df6ca6ba0c89a9693ed7dff49a3ac63265f844713b84e1195"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.2.0-rc.2/taws-x86_64-apple-darwin.tar.gz"
      sha256 "78647ead717bddb86c5d55c109b946e01dca5b88722389e3422e6572471ad4dc"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.2.0-rc.2/taws-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5ecf67e6611192afcc8144df2e234aad63ab0310d824dd44f4da4ae466a75580"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.2.0-rc.2/taws-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8a89424c24738d868b5c2a9330770ce7b330b5a21ec19a155ae92fedbce46367"
    end
  end

  def install
    bin.install "taws"
  end

  test do
    assert_match "taws", shell_output("#{bin}/taws --help")
  end
end
