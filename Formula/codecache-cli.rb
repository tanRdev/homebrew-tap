class CodecacheCli < Formula
  desc "Local-first CLI for storing and retrieving code snippets"
  homepage "https://github.com/tanRdev/codecache-cli"
  url "https://github.com/tanRdev/codecache-cli/releases/download/v0.1.3/codecache-cli-0.1.3.tgz"
  sha256 "92cbc33c5016c2854afd7893a59da3c7f48c1eca2906ff131ac057812b9f00cf"
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
