class CodecacheCli < Formula
  desc "Local-first CLI for storing and retrieving code snippets"
  homepage "https://github.com/tanRdev/codecache-cli"
  url "https://github.com/tanRdev/codecache-cli/releases/download/v0.1.0/codecache-cli-0.1.0.tgz"
  sha256 "47f72736ec35549379f810bd32173fbc0e89ea8b9ad5a0073adbc6517e5b8997"
  license "MIT"

  depends_on "node" => ">=24.13.0"

  def install
    libexec.install Dir["*"]
    (bin/"cache").write_env_script libexec/"bin/cache.js", {
      "NODE_PATH" => libexec/"node_modules"
    }
  end

  test do
    output = shell_output("#{bin}/cache help")
    assert_match "codecache-cli", output
  end
end
