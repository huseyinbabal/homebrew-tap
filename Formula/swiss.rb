# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Swiss < Formula
  desc "Swiss army knife for Developer's daily basis tools e.g. Base64 encode/decode, password generator"
  homepage "https://github.com/huseyinbabal/swiss"
  version "0.0.1-rc.12"
  license "MIT"
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/swiss/releases/download/0.0.1-rc.12/swiss_0.0.1-rc.12_Darwin_arm64.tar.gz", using: CurlDownloadStrategy
      sha256 "d974027109dbef942ca656e23cde5edbb235fbc3e74c8ff8fa068cf033821387"

      def install
        bin.install "swiss"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/swiss/releases/download/0.0.1-rc.12/swiss_0.0.1-rc.12_Darwin_x86_64.tar.gz", using: CurlDownloadStrategy
      sha256 "ae0fbb48151488631cc365aad7f721db7d5a1517b2afb9d1d7e26feaeca38e5a"

      def install
        bin.install "swiss"
      end
    end
  end
end
