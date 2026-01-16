# typed: false
# frozen_string_literal: true

class Taws < Formula
  desc "Terminal UI for AWS"
  homepage "https://github.com/huseyinbabal/taws"
  version "1.2.0-rc.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.2.0-rc.4/taws-aarch64-apple-darwin.tar.gz"
      sha256 "5916ce0dfa486dc6e9c213cc25e574cd32068e60468825306ebc5beeaf42ea3f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.2.0-rc.4/taws-x86_64-apple-darwin.tar.gz"
      sha256 "f5d73db7f1e62ddecfb5c751fdbc71f0b292f4edf2049740f548651ca693c15a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.2.0-rc.4/taws-aarch64-unknown-linux-musl.tar.gz"
      sha256 "79bef039cebc6df00ba9639df03880aa9b33bde225822d89ad1e5ba8e1403d85"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.2.0-rc.4/taws-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d90e3032a89f46455cc477681aba83df4b191dc1a1d4bc64e0f583333b9102e7"
    end
  end

  def install
    bin.install "taws"
  end

  test do
    assert_match "taws", shell_output("#{bin}/taws --help")
  end
end
