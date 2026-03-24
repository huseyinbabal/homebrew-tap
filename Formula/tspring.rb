# typed: false
# frozen_string_literal: true

class Tspring < Formula
  desc "Terminal UI for Spring Boot - A modern TUI for managing Spring Boot applications"
  homepage "https://github.com/huseyinbabal/tsb"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/tsb/releases/download/v1.0.0/tspring-aarch64-apple-darwin.tar.gz"
      sha256 "03def04cb1aa626930481ab31aac87fcfc48a154c91b9bf0beed545303e4b890"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tsb/releases/download/v1.0.0/tspring-x86_64-apple-darwin.tar.gz"
      sha256 "c7af3e6aa36e3cfbdb377b247e5474b1a41716d79d8b05145162ef38f00e7ab0"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/tsb/releases/download/v1.0.0/tspring-aarch64-unknown-linux-musl.tar.gz"
      sha256 "361a58597b52fc005551dc72bb390fd65d9491acbe005ae80e78d0a32d479714"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tsb/releases/download/v1.0.0/tspring-x86_64-unknown-linux-musl.tar.gz"
      sha256 "daa22db8cfac4bb9772b1f757e54b49dd6654aa99622d907d1563e293a51400b"
    end
  end

  def install
    bin.install "tspring"
  end

  test do
    assert_match "tspring", shell_output("#{bin}/tspring --help")
  end
end
