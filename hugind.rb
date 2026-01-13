class Hugind < Formula
  desc "Dart-based CLI for LLMs"
  homepage "https://github.com/netdur/hugind"
  # REPLACE THE URL BELOW with your actual GitHub Release asset link
  url "https://github.com/netdur/hugind/releases/download/v0.6.0/hugind-macos-arm64.tar.gz"
  # REPLACE THE SHA BELOW with the one generated in Step 1
  sha256 "113f4088c1b72f561a665d051be7a8ed212954fca8ced2598cad13e3ecdbd696"
  version "0.6.0"

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