# typed: false
# frozen_string_literal: true

class Taws < Formula
  desc "Terminal UI for AWS"
  homepage "https://github.com/huseyinbabal/taws"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.1.0/taws-aarch64-apple-darwin.tar.gz"
      sha256 "9f80510d42733d07de139876dd8cc3fa872210fa80de4635bb8cc6ffe6ee2708"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.1.0/taws-x86_64-apple-darwin.tar.gz"
      sha256 "b15d47e841e6a085a16f7b4fbeee05f7bf8e6a3643fdd17fe1ec7128051098e0"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.1.0/taws-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7f355eddd973b7269e0ec334825efa8eed121bbae6a50ca6662ea4c46031b188"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.1.0/taws-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bd8c92680fa083801790397fa6d59131bedc6d52bd12c78e944286e8c03f1d7c"
    end
  end

  def install
    bin.install "taws"
  end

  test do
    assert_match "taws", shell_output("#{bin}/taws --help")
  end
end
