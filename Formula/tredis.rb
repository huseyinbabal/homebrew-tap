# typed: false
# frozen_string_literal: true

class Tredis < Formula
  desc "Terminal UI for Redis"
  homepage "https://github.com/huseyinbabal/tredis"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/tredis/releases/download/v1.2.0/tredis-aarch64-apple-darwin.tar.gz"
      sha256 "2a5c25f9f2a9ad516ac35b8752677377d6bdf2c0bbac36893fa974a9656f066e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tredis/releases/download/v1.2.0/tredis-x86_64-apple-darwin.tar.gz"
      sha256 "04381d652d345566960771955559ae5b74269cdc632045d67602e6d5cfea5728"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/tredis/releases/download/v1.2.0/tredis-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e1fdd13904ffaf9d00921d87b96f326b0eff0bd977b076878dac3e6bb3a4cf03"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tredis/releases/download/v1.2.0/tredis-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1dd74162fc238b4eade54312259390a4184b827627b9a624814db8c4e0d59143"
    end
  end

  def install
    bin.install "tredis"
  end

  test do
    assert_match "tredis", shell_output("#{bin}/tredis --help")
  end
end
