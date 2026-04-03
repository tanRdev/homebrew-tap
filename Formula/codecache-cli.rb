class CodecacheCli < Formula
  desc "Local-first CLI for storing and retrieving code snippets"
  homepage "https://github.com/tanRdev/codecache-cli"
  url "https://github.com/tanRdev/codecache-cli/releases/download/v0.1.1/codecache-cli-0.1.1.tgz"
  sha256 "cd495307590e397785ed65b535b55367e7c0776ce81f23762bdf39c2db5984e9"
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
