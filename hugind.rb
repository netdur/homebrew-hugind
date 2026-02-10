class Hugind < Formula
  desc "Dart-based CLI for LLMs"
  homepage "https://github.com/netdur/hugind"
  # REPLACE THE URL BELOW with your actual GitHub Release asset link
  url "https://github.com/netdur/hugind/releases/download/v0.10.0/hugind-macos-arm64.tar.gz"
  # REPLACE THE SHA BELOW with the one generated in Step 1
  sha256 "432d9338f06ada5e8c7f02506c59b9219fc81d886d928a0fbe354900a09c4b9a"
  version "0.10.0"

  def install
    # libexec is a private directory where we put all files (binary + libs + config)
    # so they stay in the same relative path structure.
    libexec.install Dir["*"]

    # Create a wrapper script in /usr/local/bin (or /opt/homebrew/bin)
    # that launches the binary from inside libexec.
    # This ensures the binary can find the adjacent .dylib and config files.
    (bin/"hugind").write_env_script libexec/"hugind", {}
  end

  test do
    system "#{bin}/hugind", "--help"
  end
end