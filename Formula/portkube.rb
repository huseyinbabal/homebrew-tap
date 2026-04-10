# typed: false
# frozen_string_literal: true

class Portkube < Formula
  desc "Access Kubernetes services from localhost by their DNS names"
  homepage "https://github.com/huseyinbabal/portkube"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/portkube/releases/download/v1.0.0/portkube-aarch64-apple-darwin.tar.gz"
      sha256 "e6f5e8ce29cd6642c303066b1aae61daf8864bcf35a717d293e39775775a1647"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/portkube/releases/download/v1.0.0/portkube-x86_64-apple-darwin.tar.gz"
      sha256 "65c5558ea2b2eda177831aea3a73c361f17f6311b9bf25db10e6f9a6f68c80fa"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/portkube/releases/download/v1.0.0/portkube-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8c5b19626cdaebc1fd41930df652a3a84d7f9a006d95887392df63c79a74421a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/portkube/releases/download/v1.0.0/portkube-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e63f6e17e6586afd0ee5c0b2cc77816ecff2c95d5212a37480c8cb179a31b0b5"
    end
  end

  def install
    bin.install "portkube"
  end

  test do
    assert_match "portkube", shell_output("#{bin}/portkube --help")
  end
end
