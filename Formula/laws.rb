# typed: false
# frozen_string_literal: true

class Laws < Formula
  desc "Local AWS - a lightweight, fast AWS emulator written in Rust"
  homepage "https://github.com/huseyinbabal/laws"
  version "1.0.0-rc.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/laws/releases/download/v1.0.0-rc.2/laws-aarch64-apple-darwin.tar.gz"
      sha256 "e92d471119b540a185fc11a51aaa2961ee2b9fee0a7a1604e784e316d0270e8f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/laws/releases/download/v1.0.0-rc.2/laws-x86_64-apple-darwin.tar.gz"
      sha256 "715b2e20caf091bde5dd0b45452f3b4ad00f548641a65be7aa51c43acefa33fc"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/laws/releases/download/v1.0.0-rc.2/laws-aarch64-unknown-linux-musl.tar.gz"
      sha256 "324b55cc21a83f8e5cbed8159709fa5db8475ba0fb6a0b4765ddac26cc48f563"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/laws/releases/download/v1.0.0-rc.2/laws-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9aa96416c95bdbd6336862e5e0c7d78922912d90646eb6895e5d475962d0ff3a"
    end
  end

  def install
    bin.install "laws"
  end

  test do
    assert_match "laws", shell_output("#{bin}/laws --help")
  end
end
