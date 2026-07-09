class Scootlens < Formula
  desc "Programmable web runtime for AI agents: kernel daemon, CLI, MCP projection"
  homepage "https://github.com/scootship/scootlens"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scootship/scootlens/releases/download/v0.2.0/scootlens-v0.2.0-macos-arm64.tar.gz"
      sha256 "601b1cc7be82ad416af1eb8425517faf9e42d1ed504f319b655521fb23269834"
    else
      url "https://github.com/scootship/scootlens/releases/download/v0.2.0/scootlens-v0.2.0-macos-amd64.tar.gz"
      sha256 "2bf625470d15719e684770ea61bcf93c4bdbc310974c77e7949c3bcb32cab4d2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/scootship/scootlens/releases/download/v0.2.0/scootlens-v0.2.0-linux-arm64.tar.gz"
      sha256 "6068478fcff9c5f85b07999267f9a3417032b25a78c718e199c60e1e8ab6338d"
    else
      url "https://github.com/scootship/scootlens/releases/download/v0.2.0/scootlens-v0.2.0-linux-amd64.tar.gz"
      sha256 "1359ab708c629ac48a48dba2519bde126841ef32edb54484106107f2dc0870ee"
    end
  end

  def install
    bin.install "scootlensd", "scootctl", "scootlens-mcp"
  end

  def caveats
    <<~EOS
      Start the daemon (prints the admin token on the first line):
        scootlensd --engine mock

      The Web Console is embedded in scootlensd and served at / by
      default; point --console-dir at a custom build to override it.

      The chromium engine attaches to a locally installed Chromium/Chrome
      (override discovery with SCOOTLENS_CHROMIUM_BIN).
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/scootctl --version")
  end
end
