class ScootWasm < Formula
  desc "Optional standalone Wasm compute-unit host for scoot"
  homepage "https://github.com/scootship/scoot"
  version "0.9.2"
  license "MIT"

  # Installing the host pulls in the agent so wasm_tool works end-to-end.
  depends_on "scootship/tap/scoot"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scootship/scoot/releases/download/v0.9.2/scoot-wasm-v0.9.2-macos-arm64.tar.gz"
      sha256 "2190bdc5ead7149be6a79898362ea86876e300d36dd4a3c3222fcae834f71973"
    else
      url "https://github.com/scootship/scoot/releases/download/v0.9.2/scoot-wasm-v0.9.2-macos-amd64.tar.gz"
      sha256 "335e560f892b4f7b2053a8eab1eeee6a0096bcaf0ff290219ab433359e0e7c81"
    end
  end

  def install
    bin.install "scoot-wasm"
  end

  test do
    assert_path_exists bin/"scoot-wasm"
  end
end
