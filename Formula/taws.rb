# typed: false
# frozen_string_literal: true

class Taws < Formula
  desc "Terminal UI for AWS"
  homepage "https://github.com/huseyinbabal/taws"
  version "1.2.0-rc.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.2.0-rc.3/taws-aarch64-apple-darwin.tar.gz"
      sha256 "e7c005e03ffd3dd9cdcc0ddd58bac050362719447b6909f6863d6db1b0450035"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.2.0-rc.3/taws-x86_64-apple-darwin.tar.gz"
      sha256 "bd1462b51ff9608d2252af1446df76d2647bb88bc1873bcdbde407c93fe1a901"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.2.0-rc.3/taws-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3d6e1cef9d224fa19aa0fc0a2b3a35ac847cd70ec16c63d5d6183a5ed38d4869"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.2.0-rc.3/taws-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d40f6edc75fc5e7e9de8191da28d4b3daacc9067c4e3eef2eac79ca4192b588d"
    end
  end

  def install
    bin.install "taws"
  end

  test do
    assert_match "taws", shell_output("#{bin}/taws --help")
  end
end
