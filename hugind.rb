class Hugind < Formula
  desc "Dart-based CLI for LLMs"
  homepage "https://github.com/netdur/hugind"
  # REPLACE THE URL BELOW with your actual GitHub Release asset link
  url "https://github.com/netdur/hugind/releases/download/v0.1.3/hugind-macos-arm64.tar.gz"
  # REPLACE THE SHA BELOW with the one generated in Step 1
  sha256 "2e31919af89a7e41f9a12573b4891f17e69ffb5e9e7d791162c4c0c4636903a8"
  version "0.1.3"

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