# typed: false
# frozen_string_literal: true

class Portkube < Formula
  desc "Access Kubernetes services from localhost by their DNS names"
  homepage "https://github.com/huseyinbabal/portkube"
  version "1.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/portkube/releases/download/v1.0.1/portkube-aarch64-apple-darwin.tar.gz"
      sha256 "9ba97076c903fa12ef9bac26bc85838e22a773879b78fab393090bc86b4749f4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/portkube/releases/download/v1.0.1/portkube-x86_64-apple-darwin.tar.gz"
      sha256 "98df11d143b72437890a6a8c9a08c906d8082d6bc6e076365260bc7967feb6fe"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/portkube/releases/download/v1.0.1/portkube-aarch64-unknown-linux-musl.tar.gz"
      sha256 "daab78573f92d997b7b0768f34990bd1c505faa295fbbc0e69a9228c125c4257"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/portkube/releases/download/v1.0.1/portkube-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e864ecb747c9185129bf321bdebd2512a649c24eb483b335b76ec2384b263fb5"
    end
  end

  def install
    bin.install "portkube"
  end

  test do
    assert_match "portkube", shell_output("#{bin}/portkube --help")
  end
end
