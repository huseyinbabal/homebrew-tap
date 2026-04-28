# typed: false
# frozen_string_literal: true

class Taws < Formula
  desc "Terminal UI for AWS"
  homepage "https://github.com/huseyinbabal/taws"
  version "1.3.0-rc.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.3.0-rc.8/taws-aarch64-apple-darwin.tar.gz"
      sha256 "b095d11839def114ebb86db784f2e9d5ddfab5cff919b48af5986898d26291f0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.3.0-rc.8/taws-x86_64-apple-darwin.tar.gz"
      sha256 "e49ffcbae88967db03ef22e277831ba5b5cd26ffaea91402d851e603b04f8086"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.3.0-rc.8/taws-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e104794af55fbd51f654478a743e546c51cd3dbe2accbdd50198ac8ae22f21ea"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.3.0-rc.8/taws-x86_64-unknown-linux-musl.tar.gz"
      sha256 "021c935ad19a038cc5c59f436cb2b480ff9f981266c830ad20cc80d58250f8b5"
    end
  end

  def install
    bin.install "taws"
  end

  test do
    assert_match "taws", shell_output("#{bin}/taws --help")
  end
end
