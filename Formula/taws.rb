# typed: false
# frozen_string_literal: true

class Taws < Formula
  desc "Terminal UI for AWS"
  homepage "https://github.com/huseyinbabal/taws"
  version "1.2.0-rc.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.2.0-rc.1/taws-aarch64-apple-darwin.tar.gz"
      sha256 "ce3684b87a7ad1681a6d99f1710681a44a96c586766637275225e28c23e93253"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.2.0-rc.1/taws-x86_64-apple-darwin.tar.gz"
      sha256 "4ead23ccac75a500b797056bb972407369f085ec80d3422f7f3173c2a3df6c60"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.2.0-rc.1/taws-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7d0dabc5ecd47503a7164aca9a2886e09133b7461ae90775e4e1c3913f93f458"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.2.0-rc.1/taws-x86_64-unknown-linux-musl.tar.gz"
      sha256 "640aae5de1508a96e08062c15ad4dec33a6783c8c528617ec5f634b7deb0b962"
    end
  end

  def install
    bin.install "taws"
  end

  test do
    assert_match "taws", shell_output("#{bin}/taws --help")
  end
end
