class Red < Formula
  desc "Modern, modal text editor built in Rust"
  homepage "https://github.com/codersauce/red"
  version "0.2.1"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/codersauce/red/releases/download/v0.2.1/red-aarch64-apple-darwin.tar.gz"
      sha256 "b60907d51e340aa8fb02973ad5b886d550aaa0d2e0f58bb01b271dd22e3a8f55"
    else
      url "https://github.com/codersauce/red/releases/download/v0.2.1/red-x86_64-apple-darwin.tar.gz"
      sha256 "ddcdb4eb62032e6136d49bd45b6315db77ae85bb5f51097fc4e08b54136b6e3a"
    end
  elsif OS.linux?
    url "https://github.com/codersauce/red/releases/download/v0.2.1/red-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b9fc784cc9fc4c302db56eec2c2a729139cd0483413c63e8f02167e78e48f5f8"
  end

  def install
    bin.install "red"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/red --version")
    assert_match "red self-check ok", shell_output("#{bin}/red --self-check")
  end
end
