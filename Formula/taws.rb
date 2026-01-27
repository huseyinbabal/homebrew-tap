# typed: false
# frozen_string_literal: true

class Taws < Formula
  desc "Terminal UI for AWS"
  homepage "https://github.com/huseyinbabal/taws"
  version "1.3.0-rc.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.3.0-rc.5/taws-aarch64-apple-darwin.tar.gz"
      sha256 "908bddcb393feb701099554a237e787af33dbcd558c1553a2a867a5292ba6b31"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.3.0-rc.5/taws-x86_64-apple-darwin.tar.gz"
      sha256 "bba4836f94ce0a5af3e1d0fb879b4383990c5b21b6976b4fe48eb43642d5dfd7"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.3.0-rc.5/taws-aarch64-unknown-linux-musl.tar.gz"
      sha256 "cbd3c375adc280ea1f77dfd5a0d84635640b299b391e361d90d1218c57221fd0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.3.0-rc.5/taws-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3b55502249366edd44035257785eff34a0669b42ee9431c21af5ec77d1385b1b"
    end
  end

  def install
    bin.install "taws"
  end

  test do
    assert_match "taws", shell_output("#{bin}/taws --help")
  end
end
