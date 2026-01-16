# typed: false
# frozen_string_literal: true

class Taws < Formula
  desc "Terminal UI for AWS"
  homepage "https://github.com/huseyinbabal/taws"
  version "1.2.0-rc.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.2.0-rc.6/taws-aarch64-apple-darwin.tar.gz"
      sha256 "b5e89c78a5ae1bbdfeabce9dd34a8dade5d6fd4b05bf895f9b0d77304bbbfff6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.2.0-rc.6/taws-x86_64-apple-darwin.tar.gz"
      sha256 "c6250fc7a49e32834bc24868641db6cd61dc339904b92a937fa2b7ff135adda9"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.2.0-rc.6/taws-aarch64-unknown-linux-musl.tar.gz"
      sha256 "699e0e3dad50a4bfe07979274020a81a97d5ab5c848d6c54d8bbabb9e7491e3a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.2.0-rc.6/taws-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4c684465b108b8d4a00faaa33b8b7a2648f7351979e2f11cbd0480ba562220b4"
    end
  end

  def install
    bin.install "taws"
  end

  test do
    assert_match "taws", shell_output("#{bin}/taws --help")
  end
end
