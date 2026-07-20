class Red < Formula
  desc "Modern, modal text editor built in Rust"
  homepage "https://github.com/codersauce/red"
  version "0.2.3"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/codersauce/red/releases/download/v0.2.3/red-aarch64-apple-darwin.tar.gz"
      sha256 "a2195d71d599d8dfb56226b55b03db56e2c96d38353b9e299093abcfd6588e1c"
    else
      url "https://github.com/codersauce/red/releases/download/v0.2.3/red-x86_64-apple-darwin.tar.gz"
      sha256 "74d04db328766ecb2bb3dfd07f55a099d20cb66464f0f2dd68fb7d244a7b5e8f"
    end
  elsif OS.linux?
    url "https://github.com/codersauce/red/releases/download/v0.2.3/red-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b7ed3b1a557f053ec75941601ae7d490d88d324c94a8312c6c0b73033e5c56fe"
  end

  def install
    bin.install "red"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/red --version")
    assert_match "red self-check ok", shell_output("#{bin}/red --self-check")
  end
end
