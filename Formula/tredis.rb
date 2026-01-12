# typed: false
# frozen_string_literal: true

class Tredis < Formula
  desc "Terminal UI for Redis"
  homepage "https://github.com/huseyinbabal/tredis"
  version "1.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/tredis/releases/download/v1.0.1/tredis-aarch64-apple-darwin.tar.gz"
      sha256 "c35ec5197d2d335997f6e35c7b0d15cfe48d413f24974d89653cf8d2081e1a0e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tredis/releases/download/v1.0.1/tredis-x86_64-apple-darwin.tar.gz"
      sha256 "bbbaac49f2553cead03ffcc2244375c89ede82908a688a3695cdb39469a683e3"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/tredis/releases/download/v1.0.1/tredis-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2ae024ead4ad9a2ba35c5c67972f14aba81aa4f41d6070304a3510505af22a45"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tredis/releases/download/v1.0.1/tredis-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "478eb06897caa2d507e197686a8da981c2a9b4944ee0e793cbae072c1feed1a1"
    end
  end

  def install
    bin.install "tredis"
  end

  test do
    assert_match "tredis", shell_output("#{bin}/tredis --help")
  end
end
