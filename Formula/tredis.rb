# typed: false
# frozen_string_literal: true

class Tredis < Formula
  desc "Terminal UI for Redis"
  homepage "https://github.com/huseyinbabal/tredis"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/tredis/releases/download/v1.0.0/tredis-aarch64-apple-darwin.tar.gz"
      sha256 "2968642c289d47e3eda0d5e093aba3925ed205fec03a00303407b7402c85b751"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tredis/releases/download/v1.0.0/tredis-x86_64-apple-darwin.tar.gz"
      sha256 "1d4bd105f1daf48ac96540a00ce888665cca44eb934cbb22e7acf9d8bf035f42"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/tredis/releases/download/v1.0.0/tredis-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "676171b7d45c0c8362278bf92a60474d68d8e03b913a023b4824013e16739177"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tredis/releases/download/v1.0.0/tredis-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cb003f530fe668b623e0f88e682ae5ee34a457c4e8091c611b7ddb47d9599117"
    end
  end

  def install
    bin.install "tredis"
  end

  test do
    assert_match "tredis", shell_output("#{bin}/tredis --help")
  end
end
