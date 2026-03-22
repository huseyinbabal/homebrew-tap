# typed: false
# frozen_string_literal: true

class Laws < Formula
  desc "Local AWS - a lightweight, fast AWS emulator written in Rust"
  homepage "https://github.com/huseyinbabal/laws"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/laws/releases/download/v1.0.0/laws-aarch64-apple-darwin.tar.gz"
      sha256 "86741af24bc520322ba5151ad96df33ebfdf0dbf01ca2dfcb9784cece4dac17c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/laws/releases/download/v1.0.0/laws-x86_64-apple-darwin.tar.gz"
      sha256 "852adec5313251fef88aa91a8092c55aa9fc812edd2ac46ab25c2fa22923cad9"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/laws/releases/download/v1.0.0/laws-aarch64-unknown-linux-musl.tar.gz"
      sha256 "841d2b8ac43312df85845c425ff25cba91142595666d7c005f7234a33e76efce"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/laws/releases/download/v1.0.0/laws-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a98197e0b38cabacfc5a03499f8eda6ac4f9513ff08372b47817e16042ad1079"
    end
  end

  def install
    bin.install "laws"
  end

  test do
    assert_match "laws", shell_output("#{bin}/laws --help")
  end
end
