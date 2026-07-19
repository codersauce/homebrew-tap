class Red < Formula
  desc "Modern, modal text editor built in Rust"
  homepage "https://github.com/codersauce/red"
  version "0.2.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/codersauce/red/releases/download/v0.2.0/red-aarch64-apple-darwin.tar.gz"
      sha256 "79f47c195d4c55ce5b3890980029dcc002e3dafa5857e0e61703cf72b5a5d114"
    else
      url "https://github.com/codersauce/red/releases/download/v0.2.0/red-x86_64-apple-darwin.tar.gz"
      sha256 "c74eeb01fa39dc04f64126181b2c366c3147dcd99af4404daaf23b83d2402f46"
    end
  elsif OS.linux?
    url "https://github.com/codersauce/red/releases/download/v0.2.0/red-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "721e7db55de9ad8dc885baa65bee3ebbe36b1cf592911074f0a26ee43671ce8c"
  end

  def install
    bin.install "red"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/red --version")
    assert_match "red self-check ok", shell_output("#{bin}/red --self-check")
  end
end
