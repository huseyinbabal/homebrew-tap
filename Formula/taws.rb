# typed: false
# frozen_string_literal: true

class Taws < Formula
  desc "Terminal UI for AWS"
  homepage "https://github.com/huseyinbabal/taws"
  version "1.3.0-rc.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.3.0-rc.2/taws-aarch64-apple-darwin.tar.gz"
      sha256 "03fd747bdde97de34f45f1cd115ba5d3487d76d1cc2a144b6a5ba430d013f94d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.3.0-rc.2/taws-x86_64-apple-darwin.tar.gz"
      sha256 "76b65aac4ac614d1532d07c23a03b84b451f765a2c13cba410814c6a670b3246"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.3.0-rc.2/taws-aarch64-unknown-linux-musl.tar.gz"
      sha256 "822aee85cffb9b30e1e8e7c34a353348bb093788f5632a0754387224b69f7c89"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.3.0-rc.2/taws-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ee04eb616ba1eda493b533d5ea76fd2aa2bc89de0e8517de39acefa9333a2ded"
    end
  end

  def install
    bin.install "taws"
  end

  test do
    assert_match "taws", shell_output("#{bin}/taws --help")
  end
end
