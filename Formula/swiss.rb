# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Swiss < Formula
  desc "Swiss army knife for Developer's daily basis tools e.g. Base64 encode/decode, password generator"
  homepage "https://github.com/huseyinbabal/swiss"
  version "0.0.1-rc.3"
  license "MIT"
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/huseyinbabal/swiss/releases/download/0.0.1-rc.3/swiss_0.0.1-rc.3_Darwin_arm64.tar.gz", using: CurlDownloadStrategy
      sha256 "4269e67ab75ff939b4936998fdb46e58f0591b18ff4312f727462037fd5493f1"

      def install
        bin.install "swiss"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/huseyinbabal/swiss/releases/download/0.0.1-rc.3/swiss_0.0.1-rc.3_Darwin_x86_64.tar.gz", using: CurlDownloadStrategy
      sha256 "8df4d690b4486d9a924f182d81c66c50b4a68df9aa9ac4be92627b986c25ea01"

      def install
        bin.install "swiss"
      end
    end
  end
end
