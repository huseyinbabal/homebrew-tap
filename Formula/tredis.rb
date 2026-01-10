# typed: false
# frozen_string_literal: true

class Tredis < Formula
  desc "Terminal UI for Redis"
  homepage "https://github.com/huseyinbabal/tredis"
  version ""
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/tredis/releases/download/v/tredis-aarch64-apple-darwin.tar.gz"
      sha256 "b9bbf8464227e7579d16591cde6fb1cfea5b4a7c5f70619d5cdf2c63f3304ffc"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tredis/releases/download/v/tredis-x86_64-apple-darwin.tar.gz"
      sha256 "8f99b98b494d0289be690cd60c4b57b7616c75acffb330667fcdb180f86f3dc2"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/tredis/releases/download/v/tredis-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e5bea129d492177f75724f584ce5729426735e8231d7322d9b3c1df6bcdbb4bb"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tredis/releases/download/v/tredis-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "aa37946937278db08d3f9563550d74917fd274bb2028a3dccb4fbf079fea2743"
    end
  end

  def install
    bin.install "tredis"
  end

  test do
    assert_match "tredis", shell_output("#{bin}/tredis --help")
  end
end
