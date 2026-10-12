class Red < Formula
  desc "Modern, modal text editor built in Rust"
  homepage "https://github.com/codersauce/red"
  version "0.8.1"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/codersauce/red/releases/download/v0.8.1/red-aarch64-apple-darwin.tar.gz"
      sha256 "5c81514a4e3b2713b1d2feaad9eed4ad97ad1aa88183605dcb993fab0036422b"
    else
      url "https://github.com/codersauce/red/releases/download/v0.8.1/red-x86_64-apple-darwin.tar.gz"
      sha256 "18d2096a202ec5385b01baecddc60b1e7c02884f4f3b7cb1304e575f0a299be4"
    end
  elsif OS.linux?
    url "https://github.com/codersauce/red/releases/download/v0.8.1/red-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d1bece56597c3ce800ffdbc4481891048c8272e0c6e7a1085a5750ad9bf4ee9a"
  end

  def install
    bin.install "red"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/red --version")
    assert_match "red self-check ok", shell_output("#{bin}/red --self-check")
  end
end
