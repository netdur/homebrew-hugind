class Hugind < Formula
  desc "Dart-based CLI for LLMs"
  homepage "https://github.com/netdur/hugind"
  # REPLACE THE URL BELOW with your actual GitHub Release asset link
  url "https://github.com/netdur/hugind/releases/download/v0.1.0/hugind-macos-arm64.tar.gz"
  # REPLACE THE SHA BELOW with the one generated in Step 1
  sha256 "c661bf8524b8050d228c3d7fb6ee2c4b2b6e91d22952eba55f15bbff37ce3fc0"
  version "0.1.0"

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