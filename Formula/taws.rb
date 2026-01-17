# typed: false
# frozen_string_literal: true

class Taws < Formula
  desc "Terminal UI for AWS"
  homepage "https://github.com/huseyinbabal/taws"
  version "1.2.0-rc.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.2.0-rc.7/taws-aarch64-apple-darwin.tar.gz"
      sha256 "5c85e1bd54ef5b3907f02dca823bf322668c14c893808f502deed3e22d7bc9e3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.2.0-rc.7/taws-x86_64-apple-darwin.tar.gz"
      sha256 "d152bb145011dd470f38e6a72d471af51cd1526361003ef718a1ea94e61960d2"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.2.0-rc.7/taws-aarch64-unknown-linux-musl.tar.gz"
      sha256 "86f422cb097b4d26e4917209a880fd606e56c7b961ee33d68bbc667138e5bcb1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.2.0-rc.7/taws-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3e855bd5a6d847311196d954527100329486c5e621cc5881e4b7f8c777ae29f8"
    end
  end

  def install
    bin.install "taws"
  end

  test do
    assert_match "taws", shell_output("#{bin}/taws --help")
  end
end
