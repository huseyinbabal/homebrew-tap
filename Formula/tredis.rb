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
      sha256 "a795d272363c16e42194db7b641b90d692d5a7aeeba9dd55b2154523d88a33bc"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tredis/releases/download/v/tredis-x86_64-apple-darwin.tar.gz"
      sha256 "cd10df20b2f3ceff328cf4bcc591b7349e7b0dec9958b2bb37fa23befb385ed2"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/tredis/releases/download/v/tredis-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "08e4f7b1c047f36aad3f1f3ea067437bd28174139f88ebd270fae94a63edfc8d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tredis/releases/download/v/tredis-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3aac8e2621b93f8d591c4c233945fb58840ede3bb7cc649a8031aa6a729ff31e"
    end
  end

  def install
    bin.install "tredis"
  end

  test do
    assert_match "tredis", shell_output("#{bin}/tredis --help")
  end
end
