# typed: false
# frozen_string_literal: true

class Portkube < Formula
  desc "Access Kubernetes services from localhost by their DNS names"
  homepage "https://github.com/huseyinbabal/portkube"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/portkube/releases/download/v1.1.0/portkube-aarch64-apple-darwin.tar.gz"
      sha256 "1e43e70d3f4140c5dad0e140df6593d980a44281557ac0915216222bfdb7a2c8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/portkube/releases/download/v1.1.0/portkube-x86_64-apple-darwin.tar.gz"
      sha256 "8dae92fdd0e72ed4650d18bcd90c1e3bb3b767aa7c30280b98c1919743f94d6f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/portkube/releases/download/v1.1.0/portkube-aarch64-unknown-linux-musl.tar.gz"
      sha256 "fd0948026f04f80a2a0023f0b141d24ca34a92a40455681de8f1db2f9db19ea3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/portkube/releases/download/v1.1.0/portkube-x86_64-unknown-linux-musl.tar.gz"
      sha256 "986c2a4f9f99ebe78a22c174c7e4a39e3121734f01e8177685974e13a86a70c7"
    end
  end

  def install
    bin.install "portkube"
  end

  test do
    assert_match "portkube", shell_output("#{bin}/portkube --help")
  end
end
