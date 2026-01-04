# typed: false
# frozen_string_literal: true

class Taws < Formula
  desc "Terminal UI for AWS"
  homepage "https://github.com/huseyinbabal/taws"
  version "1.0.0-rc.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.0.0-rc.4/taws-aarch64-apple-darwin.tar.gz"
      sha256 "91e2b5a6e8d519230684cee1e93825d7cfc0b635b927fc1dd0026c73269bb9bd"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.0.0-rc.4/taws-x86_64-apple-darwin.tar.gz"
      sha256 "ec4c4092879c0ebaeab5405b64a2d470da43bdb0dbb299bed69ed0e72a270418"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.0.0-rc.4/taws-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f9dd23985318aa7b640e285ae6aea6e397653f66831b12e65e8ee515c5392077"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.0.0-rc.4/taws-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4c96cfb53b273f3e5d47f36df7934b454f15a966ff9d54f72f26c7cd24f7fddd"
    end
  end

  def install
    bin.install "taws"
  end

  test do
    assert_match "taws", shell_output("#{bin}/taws --help")
  end
end
