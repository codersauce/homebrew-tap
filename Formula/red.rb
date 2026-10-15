class Red < Formula
  desc "Modern, modal text editor built in Rust"
  homepage "https://github.com/codersauce/red"
  version "0.9.1"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/codersauce/red/releases/download/v0.9.1/red-aarch64-apple-darwin.tar.gz"
      sha256 "f61697d38ab8218260ed5a5cf29142a58d1a3d7daf2414b5bc3f6cd2372817ef"
    else
      url "https://github.com/codersauce/red/releases/download/v0.9.1/red-x86_64-apple-darwin.tar.gz"
      sha256 "815593afd5e70f0c7d7ce81c3ea9a68e1d80d680a8c0b39d4dc250a4c33d3c71"
    end
  elsif OS.linux?
    url "https://github.com/codersauce/red/releases/download/v0.9.1/red-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a612c3980f792b024706fd9aafcca612a66961486ba9255a0352581221527804"
  end

  def install
    bin.install "red"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/red --version")
    assert_match "red self-check ok", shell_output("#{bin}/red --self-check")
  end
end
