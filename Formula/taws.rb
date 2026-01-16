# typed: false
# frozen_string_literal: true

class Taws < Formula
  desc "Terminal UI for AWS"
  homepage "https://github.com/huseyinbabal/taws"
  version "1.2.0-rc.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.2.0-rc.5/taws-aarch64-apple-darwin.tar.gz"
      sha256 "3bceb8422dca906e574ae1cde467f39440e62aad631f05a0468f892f926d81d2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.2.0-rc.5/taws-x86_64-apple-darwin.tar.gz"
      sha256 "776ddb9c9a6b03a59459ce43e2ea5dd3f8a7fc6fdf19ed59042f8ae3677f4adb"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.2.0-rc.5/taws-aarch64-unknown-linux-musl.tar.gz"
      sha256 "82afafbb68daab8eff6af9d53057fd9a0a5841d62c024687b544823c2114fcd1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.2.0-rc.5/taws-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d98a89b0242a352a4e03c0e5a1adefb2abe42b031e2c962b6244e9805a6ddb12"
    end
  end

  def install
    bin.install "taws"
  end

  test do
    assert_match "taws", shell_output("#{bin}/taws --help")
  end
end
