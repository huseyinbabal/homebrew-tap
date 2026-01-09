# typed: false
# frozen_string_literal: true

class Taws < Formula
  desc "Terminal UI for AWS"
  homepage "https://github.com/huseyinbabal/taws"
  version "1.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.1.4/taws-aarch64-apple-darwin.tar.gz"
      sha256 "18467d36bb80bfd94ff9b178ace969082eca2782ba1a914c99543490e2814d2f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.1.4/taws-x86_64-apple-darwin.tar.gz"
      sha256 "18945bd2ceafc1771106a3904a98b90e858a1f92d3683d5397213c2640dc7d1d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.1.4/taws-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a17904ca44d9bb7cd10b29a6bbc488447da9a8032aa5c721d12cba95d7d9ca10"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/taws/releases/download/v1.1.4/taws-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9fd2091c2fe1f679c89b642a97ff4b6a6c124bee22dc23671a35e2747a7852da"
    end
  end

  def install
    bin.install "taws"
  end

  test do
    assert_match "taws", shell_output("#{bin}/taws --help")
  end
end
