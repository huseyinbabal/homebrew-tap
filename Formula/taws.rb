# typed: false
# frozen_string_literal: true

class Taws < Formula
  desc "Terminal UI for AWS"
  homepage "https://github.com/huseyinbabal/taws"
  version "1.3.0-rc.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.3.0-rc.3/taws-aarch64-apple-darwin.tar.gz"
      sha256 "9405e7f12c0fce41ff4c6b3835c70cb494f3588a71b2dc70d534830473ee8028"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.3.0-rc.3/taws-x86_64-apple-darwin.tar.gz"
      sha256 "759dff7251972fd890fad518b6b8f1b82d850bb0ce64f6ff6086230a0060fb21"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.3.0-rc.3/taws-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9ff4ecbcce1afaef4496293537c521a1678a0d6454355e49c5e7c3bce1ea30eb"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.3.0-rc.3/taws-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4ae8adab111d4087309bf621b8e7e3ca0c78d53ca6fe8b7524a7ff94213b5445"
    end
  end

  def install
    bin.install "taws"
  end

  test do
    assert_match "taws", shell_output("#{bin}/taws --help")
  end
end
