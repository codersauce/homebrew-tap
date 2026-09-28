class Red < Formula
  desc "Modern, modal text editor built in Rust"
  homepage "https://github.com/codersauce/red"
  version "0.8.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/codersauce/red/releases/download/v0.8.0/red-aarch64-apple-darwin.tar.gz"
      sha256 "a2a2e54bf652c536ea7c1a08059e4bf60bcf23f3e1d254b1d1c9d539e7c5a292"
    else
      url "https://github.com/codersauce/red/releases/download/v0.8.0/red-x86_64-apple-darwin.tar.gz"
      sha256 "9754cc8c2b31d85d644b81e6ea13041eadb2ad8dd740a473100ed81e68a47aea"
    end
  elsif OS.linux?
    url "https://github.com/codersauce/red/releases/download/v0.8.0/red-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "bd7bbdbcaef9ddad9b55fa3058199230cdc75f8fa330ac9b32ad8d66aeee303f"
  end

  def install
    bin.install "red"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/red --version")
    assert_match "red self-check ok", shell_output("#{bin}/red --self-check")
  end
end
