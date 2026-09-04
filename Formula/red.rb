class Red < Formula
  desc "Modern, modal text editor built in Rust"
  homepage "https://github.com/codersauce/red"
  version "0.7.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/codersauce/red/releases/download/v0.7.0/red-aarch64-apple-darwin.tar.gz"
      sha256 "1ee74714d1b01be019d69f91efe63934048da0e1b1e21b10d344b2b96ccd3749"
    else
      url "https://github.com/codersauce/red/releases/download/v0.7.0/red-x86_64-apple-darwin.tar.gz"
      sha256 "89f0c23b0e1eb71ebcb8b06ce5cbeb0754a3d8d0e89cd698df43a815f96a1ead"
    end
  elsif OS.linux?
    url "https://github.com/codersauce/red/releases/download/v0.7.0/red-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0ef59f03cef628fda6506c84603e7b1dbb260766a2b660de9d9f565e2e53a05b"
  end

  def install
    bin.install "red"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/red --version")
    assert_match "red self-check ok", shell_output("#{bin}/red --self-check")
  end
end
