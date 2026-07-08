class Scootlens < Formula
  desc "Programmable web runtime for AI agents: kernel daemon, CLI, MCP projection"
  homepage "https://github.com/scootship/scootlens"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scootship/scootlens/releases/download/v0.1.0/scootlens-v0.1.0-macos-arm64.tar.gz"
      sha256 "09e89726adc1576a5debb720f7f35da1ff9aed69a06a2ce5ef3760b94dbc7090"
    else
      url "https://github.com/scootship/scootlens/releases/download/v0.1.0/scootlens-v0.1.0-macos-amd64.tar.gz"
      sha256 "d657d7dd6fe578790bfa761d5608328dcf5aec596db98e14025b30564c197394"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/scootship/scootlens/releases/download/v0.1.0/scootlens-v0.1.0-linux-arm64.tar.gz"
      sha256 "717f8f3fd15812fb1419610b598811153e4a215ecf20180c46e235bdde016291"
    else
      url "https://github.com/scootship/scootlens/releases/download/v0.1.0/scootlens-v0.1.0-linux-amd64.tar.gz"
      sha256 "099067af093539e9b7692d839f54ee0c2325431847bf1bbf6f21308db326d17d"
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
