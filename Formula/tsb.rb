# typed: false
# frozen_string_literal: true

class Tsb < Formula
  desc "Terminal UI for Spring Boot - A modern TUI for managing Spring Boot applications"
  homepage "https://github.com/huseyinbabal/tsb"
  version "1.0.0-rc.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/tsb/releases/download/v1.0.0-rc.2/tsb-aarch64-apple-darwin.tar.gz"
      sha256 "0563420574eedfa547d6360374e16ff289d52dabc8f24b2f5fb61a0f27e528d0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tsb/releases/download/v1.0.0-rc.2/tsb-x86_64-apple-darwin.tar.gz"
      sha256 "8125333a25af104c3b47fc2d97b89a29b504d93578ad0e7d8f6e721cc0a56473"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/tsb/releases/download/v1.0.0-rc.2/tsb-aarch64-unknown-linux-musl.tar.gz"
      sha256 "295df295ad4d3768ba5cd60d05168a20f5e23b644387aafd9713f728eab570b9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tsb/releases/download/v1.0.0-rc.2/tsb-x86_64-unknown-linux-musl.tar.gz"
      sha256 "31159da523195ed01a849c3f0a8df292dfba3b2e7de0a40a2e84b347cc791050"
    end
  end

  def install
    bin.install "tsb"
  end

  test do
    assert_match "tsb", shell_output("#{bin}/tsb --help")
  end
end
