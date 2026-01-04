# typed: false
# frozen_string_literal: true

class Taws < Formula
  desc "Terminal UI for AWS"
  homepage "https://github.com/huseyinbabal/taws"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.0.0/taws-aarch64-apple-darwin.tar.gz"
      sha256 "2c1822e3339913ae638d9f517e4137dcefaa329be25c51c692b10a76e1b1efae"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.0.0/taws-x86_64-apple-darwin.tar.gz"
      sha256 "758d6dd836e119ac2a6102aae9a2e8d8aa4918f2195b8b9d37d1ffda38b1fe42"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.0.0/taws-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b73c013fc7752fd3a96fde03b0d4e0e2f4ae8ed245435a757892dbdfd37e11f6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.0.0/taws-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1886ac70bdb40ea53e62963c1e52ee102667ef2756f63f16d177f6fc394df02c"
    end
  end

  def install
    bin.install "taws"
  end

  test do
    assert_match "taws", shell_output("#{bin}/taws --help")
  end
end
