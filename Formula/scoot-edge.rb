class ScootEdge < Formula
  desc "Optional standalone fleet companion (status heartbeat + job dispatch) for scoot"
  homepage "https://github.com/scootship/scoot"
  version "0.9.2"
  license "MIT"

  # scoot-edge launches the agent as a subprocess, so installing it
  # pulls in scoot for a working end-to-end setup.
  depends_on "scootship/tap/scoot"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scootship/scoot/releases/download/v0.9.2/scoot-edge-v0.9.2-macos-arm64.tar.gz"
      sha256 "cd38115c722b3a320f65a219a90991da905885075c08de32b8f5f7b47829e9b5"
    else
      url "https://github.com/scootship/scoot/releases/download/v0.9.2/scoot-edge-v0.9.2-macos-amd64.tar.gz"
      sha256 "2d31e4fa919c162d2e7bce5025c078edf9f163fb5e5557828a495abbcc8cae05"
    end
  end

  def install
    bin.install "scoot-edge"
  end

  test do
    assert_path_exists bin/"scoot-edge"
  end
end
