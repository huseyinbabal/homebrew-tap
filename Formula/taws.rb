# typed: false
# frozen_string_literal: true

class Taws < Formula
  desc "Terminal UI for AWS"
  homepage "https://github.com/huseyinbabal/taws"
  version "1.3.0-rc.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.3.0-rc.4/taws-aarch64-apple-darwin.tar.gz"
      sha256 "975e9acad9423e126ab9f637386677f8f6a9ed5c2af57c88260779e25152c33e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.3.0-rc.4/taws-x86_64-apple-darwin.tar.gz"
      sha256 "275f9f0e41960b1f7dfe5cc2a412a3030f900fe747b7f5bbe3477eb9ee308c3b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.3.0-rc.4/taws-aarch64-unknown-linux-musl.tar.gz"
      sha256 "557fd8a5379b5df936653f9c65f9c79b4202addf109edebc34d13e71ffb7be88"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.3.0-rc.4/taws-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3c893ac48c41ea462d2b45c65528ef361c159a2637f7c1a90cdd16d6f6145c37"
    end
  end

  def install
    bin.install "taws"
  end

  test do
    assert_match "taws", shell_output("#{bin}/taws --help")
  end
end
