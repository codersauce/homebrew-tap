class Red < Formula
  desc "Modern, modal text editor built in Rust"
  homepage "https://github.com/codersauce/red"
  version "0.4.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/codersauce/red/releases/download/v0.4.0/red-aarch64-apple-darwin.tar.gz"
      sha256 "026aefdc4b799ae59ee6a2c4113c8779d02047760c37383366f8b79da357733c"
    else
      url "https://github.com/codersauce/red/releases/download/v0.4.0/red-x86_64-apple-darwin.tar.gz"
      sha256 "b5d48c34a5577fdf00a2d5de520f96baf45eb3f32be8417539b3e7c80d352262"
    end
  elsif OS.linux?
    url "https://github.com/codersauce/red/releases/download/v0.4.0/red-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c3b65fa87e2feb24c4052c9bbbf6ad926edc5f163b1a91429d2b651011b14251"
  end

  def install
    bin.install "red"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/red --version")
    assert_match "red self-check ok", shell_output("#{bin}/red --self-check")
  end
end
