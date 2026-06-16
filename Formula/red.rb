class Red < Formula
  desc "Modern, modal text editor built in Rust"
  homepage "https://github.com/codersauce/red"
  version "0.1.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/codersauce/red/releases/download/v0.1.0/red-aarch64-apple-darwin.tar.gz"
      sha256 "dfdae812a2536ce66cec89e057dc38c9ddfebb8b630d19925e7de3f5fb7933e1"
    else
      url "https://github.com/codersauce/red/releases/download/v0.1.0/red-x86_64-apple-darwin.tar.gz"
      sha256 "0441e3d2b0020bb7a36435c5502a4667fe64f925f03fe26cfba73c0ac2182ac4"
    end
  elsif OS.linux?
    url "https://github.com/codersauce/red/releases/download/v0.1.0/red-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "83e21aeaa73494648452649e3b84678deaca824a2e4f9e1464f9320dd7e15ee1"
  end

  def install
    bin.install "red"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/red --version")
  end
end
