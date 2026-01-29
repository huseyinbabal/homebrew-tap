# typed: false
# frozen_string_literal: true

class Taws < Formula
  desc "Terminal UI for AWS"
  homepage "https://github.com/huseyinbabal/taws"
  version "1.3.0-rc.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.3.0-rc.7/taws-aarch64-apple-darwin.tar.gz"
      sha256 "85a608d89d830c360190dfe6e7e49684b94ccd3bdbce006a997c2369d0623ecf"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.3.0-rc.7/taws-x86_64-apple-darwin.tar.gz"
      sha256 "492242e1551179c8d7b012641f38156b4c83a79c5bb0c7d87d2e122a68c99449"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.3.0-rc.7/taws-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ebb68cdd1854c9000a33e5a5bf83fb0614b0d0c5baa34f8e7341091149ca2522"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.3.0-rc.7/taws-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d786a15ee3945c73ba07bad291d9df934c701c1eb9599dd4125cbc36a8b53540"
    end
  end

  def install
    bin.install "taws"
  end

  test do
    assert_match "taws", shell_output("#{bin}/taws --help")
  end
end
