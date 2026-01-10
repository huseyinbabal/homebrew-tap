# typed: false
# frozen_string_literal: true

class Tredis < Formula
  desc "Terminal UI for Redis"
  homepage "https://github.com/huseyinbabal/tredis"
  version ""
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/tredis/releases/download/v/tredis-aarch64-apple-darwin.tar.gz"
      sha256 "7606d65ba93608dbd9a937a15b6b95b988bf0ef25d704a501b50b25915075c7e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tredis/releases/download/v/tredis-x86_64-apple-darwin.tar.gz"
      sha256 "89b8c403a5ab160ce9975172e49cfdc72757398d8a8d5c808a4ab59cad14880e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/huseyinbabal/tredis/releases/download/v/tredis-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5d77ece33b53797e9bf022f211609c3b0d8e0567824cb253bd26effd08334cf1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/tredis/releases/download/v/tredis-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b2eb7b09545bdb79a6948b6d2efaac12b426930a6be43af6048da1db95e7c52e"
    end
  end

  def install
    bin.install "tredis"
  end

  test do
    assert_match "tredis", shell_output("#{bin}/tredis --help")
  end
end
