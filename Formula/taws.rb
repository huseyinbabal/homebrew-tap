# typed: false
# frozen_string_literal: true

class Taws < Formula
  desc "Terminal UI for AWS"
  homepage "https://github.com/huseyinbabal/taws"
  version "1.3.0-rc.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.3.0-rc.1/taws-aarch64-apple-darwin.tar.gz"
      sha256 "4d8d5d8e01e052731f148714d1151b827b0543ba734532e4255d15113c4144d1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.3.0-rc.1/taws-x86_64-apple-darwin.tar.gz"
      sha256 "9e1532ed96f0f40737af32630338d4410d27fb472819c63b8d6f1752fbbde890"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.3.0-rc.1/taws-aarch64-unknown-linux-musl.tar.gz"
      sha256 "55c9a407ee3ebc4368cdd59acc7bde812af87120b131bc11778559684e8f4b9a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.3.0-rc.1/taws-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9f068accb59d4b4f006b21a81e79b0961d92117dcffe8cfdd0265e06aa90de7a"
    end
  end

  def install
    bin.install "taws"
  end

  test do
    assert_match "taws", shell_output("#{bin}/taws --help")
  end
end
