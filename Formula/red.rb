class Red < Formula
  desc "Modern, modal text editor built in Rust"
  homepage "https://github.com/codersauce/red"
  version "0.5.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/codersauce/red/releases/download/v0.5.0/red-aarch64-apple-darwin.tar.gz"
      sha256 "9c5a08440f9f2e59a46c8dd2dac54b059c428a6943c30ebe0eb4082d3fe38984"
    else
      url "https://github.com/codersauce/red/releases/download/v0.5.0/red-x86_64-apple-darwin.tar.gz"
      sha256 "83e648886a5abac8f930205e3d6d15398548fc55a2f04f245b197d56e5e387c2"
    end
  elsif OS.linux?
    url "https://github.com/codersauce/red/releases/download/v0.5.0/red-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a44025ec3b969344dbc96cbe5174ce534ea8fb8a02c7c916765d5d6b015f913c"
  end

  def install
    bin.install "red"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/red --version")
    assert_match "red self-check ok", shell_output("#{bin}/red --self-check")
  end
end
