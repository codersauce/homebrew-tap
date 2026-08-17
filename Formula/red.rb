class Red < Formula
  desc "Modern, modal text editor built in Rust"
  homepage "https://github.com/codersauce/red"
  version "0.6.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/codersauce/red/releases/download/v0.6.0/red-aarch64-apple-darwin.tar.gz"
      sha256 "045086a18711681ba0d0e1a44bf164e293fc94090871bd70590fe631dac175ee"
    else
      url "https://github.com/codersauce/red/releases/download/v0.6.0/red-x86_64-apple-darwin.tar.gz"
      sha256 "1b24e8b37cac1869805c70fbf80522b384c87b6d418a4a34280b6a51345d47a6"
    end
  elsif OS.linux?
    url "https://github.com/codersauce/red/releases/download/v0.6.0/red-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2a492c28e7c55f8da2a1c512aceb71fd64eed998979cb2dae5cbdf2dac80150a"
  end

  def install
    bin.install "red"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/red --version")
    assert_match "red self-check ok", shell_output("#{bin}/red --self-check")
  end
end
