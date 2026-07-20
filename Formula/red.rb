class Red < Formula
  desc "Modern, modal text editor built in Rust"
  homepage "https://github.com/codersauce/red"
  version "0.2.2"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/codersauce/red/releases/download/v0.2.2/red-aarch64-apple-darwin.tar.gz"
      sha256 "16dffdeaf52f300eeba7ea4fc03aeacf3689eb1c9bef25a48a5ddc4cf14cf42a"
    else
      url "https://github.com/codersauce/red/releases/download/v0.2.2/red-x86_64-apple-darwin.tar.gz"
      sha256 "ecb8af7cd91143bc1092769681beb9369222bbb977de0a143231e7550742f382"
    end
  elsif OS.linux?
    url "https://github.com/codersauce/red/releases/download/v0.2.2/red-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "deaba6844cd4e2515c6e908cfc02ae2a128b41c9ecf4f51aba7269b70f08d82f"
  end

  def install
    bin.install "red"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/red --version")
    assert_match "red self-check ok", shell_output("#{bin}/red --self-check")
  end
end
