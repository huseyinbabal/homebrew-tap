# typed: false
# frozen_string_literal: true

class Tredis < Formula
  desc "Terminal UI for Redis"
  homepage "https://github.com/huseyinbabal/tredis"
  version "1.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/tredis/releases/download/v1.1.1/tredis-aarch64-apple-darwin.tar.gz"
      sha256 "a4692e3884d603fe18710bc239e178ecf09c27c45c7cc75793d0e104b9b040a4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tredis/releases/download/v1.1.1/tredis-x86_64-apple-darwin.tar.gz"
      sha256 "d77171e6a8e37d326cc059417335a828ed42aeb1a9b4292be128af5de146b83d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/tredis/releases/download/v1.1.1/tredis-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ac4274a938ec0afab789173e43bfd29c86bcdf0639f8823522ff1edc3200dfb5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tredis/releases/download/v1.1.1/tredis-x86_64-unknown-linux-musl.tar.gz"
      sha256 "21f0b008a347ce39159f8ea017c0c95161c523807dd8b4dff1fed45152b0e409"
    end
  end

  def install
    bin.install "tredis"
  end

  test do
    assert_match "tredis", shell_output("#{bin}/tredis --help")
  end
end
