# typed: false
# frozen_string_literal: true

class Taws < Formula
  desc "Terminal UI for AWS"
  homepage "https://github.com/huseyinbabal/taws"
  version "1.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.2.1/taws-aarch64-apple-darwin.tar.gz"
      sha256 "027104b856781df4f8d70dad506a5141839dba602984af1e7973ba37a20fa590"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.2.1/taws-x86_64-apple-darwin.tar.gz"
      sha256 "99c812582bd685caa8d186dfc9d336ac911b33db2ede5eb0c23bc1c0d0cb67bf"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.2.1/taws-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2ab5809f9e6c2cb39fb815941eb26d722e7943340b32c0ef2572afbc937b913d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.2.1/taws-x86_64-unknown-linux-musl.tar.gz"
      sha256 "59ddf32d9891ab7ccc9deafaa26060d23785ce0fe493d97be308b86e8d48b83a"
    end
  end

  def install
    bin.install "taws"
  end

  test do
    assert_match "taws", shell_output("#{bin}/taws --help")
  end
end
