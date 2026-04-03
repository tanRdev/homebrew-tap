class CodecacheCli < Formula
  desc "Local-first CLI for storing and retrieving code snippets"
  homepage "https://github.com/tanRdev/codecache-cli"
  url "https://github.com/tanRdev/codecache-cli/releases/download/v0.1.0/codecache-cli-0.1.0.tgz"
  sha256 "160a54893e0d94b29f7419228eedd130970c5ff27cdf2b67a081cf2cf497a2c8"
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
