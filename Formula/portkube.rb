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
      sha256 "11c668322385fe92cdb88c637fc53fcecdbd7426d21d032f9cda394e9bec7e2c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/portkube/releases/download/v1.0.0/portkube-x86_64-apple-darwin.tar.gz"
      sha256 "478d960d271460247102c7fb3873534f7635cc33a9f115ad758b92a28a63cd29"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/portkube/releases/download/v1.0.0/portkube-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0c9a24cf74e24c8a296ddab40691d1faabb35eb9f277c0b70726e7a58dbaf9a8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/portkube/releases/download/v1.0.0/portkube-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8ded4c530ead8c998824aec7dcc5ce773fef0d8337f2022a1c8133a949f5e1bd"
    end
  end

  def install
    bin.install "portkube"
  end

  test do
    assert_match "portkube", shell_output("#{bin}/portkube --help")
  end
end
