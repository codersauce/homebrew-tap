class Red < Formula
  desc "Modern, modal text editor built in Rust"
  homepage "https://github.com/codersauce/red"
  version "0.8.2"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/codersauce/red/releases/download/v0.8.2/red-aarch64-apple-darwin.tar.gz"
      sha256 "e6ab4def956bc2a9bbb91889c5e617fca28d2e8512a5a5b5c1b168c052460022"
    else
      url "https://github.com/codersauce/red/releases/download/v0.8.2/red-x86_64-apple-darwin.tar.gz"
      sha256 "35560928b8df00c32376fb58aa7822fc5e8c397d008d2946dfba1b8ea6141758"
    end
  elsif OS.linux?
    url "https://github.com/codersauce/red/releases/download/v0.8.2/red-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9e9ae450224bddbdd154bbce23b4c0fa110e6e85719cfc30f1c72f5f5b21ad34"
  end

  def install
    bin.install "red"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/red --version")
    assert_match "red self-check ok", shell_output("#{bin}/red --self-check")
  end
end
