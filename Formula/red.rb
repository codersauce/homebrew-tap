class Red < Formula
  desc "Modern, modal text editor built in Rust"
  homepage "https://github.com/codersauce/red"
  version "0.9.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/codersauce/red/releases/download/v0.9.0/red-aarch64-apple-darwin.tar.gz"
      sha256 "4c45cd028193bbe009244c6e6b0e7f50433271bc3b2b7e21fee15d72f5edb673"
    else
      url "https://github.com/codersauce/red/releases/download/v0.9.0/red-x86_64-apple-darwin.tar.gz"
      sha256 "7a57404e54f45e39938863e4b32751f9bf8601c85b0172a851d381f393ed792a"
    end
  elsif OS.linux?
    url "https://github.com/codersauce/red/releases/download/v0.9.0/red-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "97b90381af6e9164425a39383cc83483601603238dc6dae5d9bc90fc9ceed99d"
  end

  def install
    bin.install "red"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/red --version")
    assert_match "red self-check ok", shell_output("#{bin}/red --self-check")
  end
end
