class Scoot < Formula
  desc "Lightweight, local-first, auditable AI agent daemon and CLI in pure Zig"
  homepage "https://github.com/scootship/scoot"
  version "0.9.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scootship/scoot/releases/download/v0.9.2/scoot-v0.9.2-macos-arm64.tar.gz"
      sha256 "f68610ca72e972b0f6ced7d437ea0aefc30e5b419aae8e21712086cfd88fe795"
    else
      url "https://github.com/scootship/scoot/releases/download/v0.9.2/scoot-v0.9.2-macos-amd64.tar.gz"
      sha256 "8bf8e9aea2a43581d27a5e6e55df7fc546b86f2d0850d84e72e179bfe0e6f3b9"
    end
  end

  def install
    bin.install "scoot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/scoot --version")
  end
end
