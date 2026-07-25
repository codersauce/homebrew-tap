class Red < Formula
  desc "Modern, modal text editor built in Rust"
  homepage "https://github.com/codersauce/red"
  version "0.2.4"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/codersauce/red/releases/download/v0.2.4/red-aarch64-apple-darwin.tar.gz"
      sha256 "5922e8145e523add88ebf2205f214938f78cd5da66eb0c981fd60fa4066e2ff0"
    else
      url "https://github.com/codersauce/red/releases/download/v0.2.4/red-x86_64-apple-darwin.tar.gz"
      sha256 "41d6d6c8eb3cd9b93c3ac4a7a5a8c4bf3dc1efcef7bf86ea14d58ef1b2063cd9"
    end
  elsif OS.linux?
    url "https://github.com/codersauce/red/releases/download/v0.2.4/red-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "493315600e2c3e6f4fb1754c1beadaac74f86ab34b2ce4b7b258ceee42b1a325"
  end

  def install
    bin.install "red"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/red --version")
    assert_match "red self-check ok", shell_output("#{bin}/red --self-check")
  end
end
