class Red < Formula
  desc "Modern, modal text editor built in Rust"
  homepage "https://github.com/codersauce/red"
  version "0.1.1"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/codersauce/red/releases/download/v0.1.1/red-aarch64-apple-darwin.tar.gz"
      sha256 "ada7652eaa7c1c3ff3d2f25e4826b69a34f381ae8b1a7a829c5c2b678dcfe927"
    else
      url "https://github.com/codersauce/red/releases/download/v0.1.1/red-x86_64-apple-darwin.tar.gz"
      sha256 "ba5b4fd8348568603f25ce90d0ade77301a484f4554db06e2f350db9e8450b50"
    end
  elsif OS.linux?
    url "https://github.com/codersauce/red/releases/download/v0.1.1/red-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c9e667663a673d16dd807ff45dc586432bfb278d6f1792fb9a621abe8cb49aa2"
  end

  def install
    bin.install "red"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/red --version")
    assert_match "red self-check ok", shell_output("#{bin}/red --self-check")
  end
end
