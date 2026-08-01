class Red < Formula
  desc "Modern, modal text editor built in Rust"
  homepage "https://github.com/codersauce/red"
  version "0.3.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/codersauce/red/releases/download/v0.3.0/red-aarch64-apple-darwin.tar.gz"
      sha256 "eeefbd1908da8c84a3aa1c600ac208f4a8f27e7eedcd37afeea24b075c9e72a7"
    else
      url "https://github.com/codersauce/red/releases/download/v0.3.0/red-x86_64-apple-darwin.tar.gz"
      sha256 "b587044ecfa4a6cb78931cd89ebc60c7b641a97173d868b60a138b0334b12c38"
    end
  elsif OS.linux?
    url "https://github.com/codersauce/red/releases/download/v0.3.0/red-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0f5af8efebbc4c16bb0787889adbaf2d3d113da2dc287e0dec403e89de243480"
  end

  def install
    bin.install "red"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/red --version")
    assert_match "red self-check ok", shell_output("#{bin}/red --self-check")
  end
end
