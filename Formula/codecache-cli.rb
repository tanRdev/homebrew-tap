class CodecacheCli < Formula
  desc "Local-first CLI for storing and retrieving code snippets"
  homepage "https://github.com/tanRdev/codecache-cli"
  url "https://github.com/tanRdev/codecache-cli/releases/download/v0.1.2/codecache-cli-0.1.2.tgz"
  sha256 "927d12977c9d5736c6b61110fb16989107e185cd81ffe37437537d8e63c0c637"
  license "MIT"

  depends_on "node" => ">=24.13.0"

  def install
    libexec.install Dir["*"]
    (bin/"cache").write <<~EOS
      #!/usr/bin/env bash
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/bin/cache.js" "$@"
    EOS
    chmod 0755, bin/"cache"
  end

  test do
    output = shell_output("#{bin}/cache help")
    assert_match "codecache-cli", output
  end
end
