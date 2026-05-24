class Mdguard < Formula
  desc "Tiny, dependency-free Markdown lint guardrails"
  homepage "https://github.com/billybox1926-jpg/mdguard"
  url "https://github.com/billybox1926-jpg/mdguard/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "d6b641f8ed50c34c6c90591818229ac05038d34eceb54f048ea7af426c276dba"
  license "MIT"

  depends_on "python@3.12"

  def install
    pkgshare.install "src/mdguard"
    (bin/"mdguard").write <<~SHELL
      #!/bin/bash
      export PYTHONPATH="#{pkgshare}"
      exec python3 -m mdguard.cli "$@"
    SHELL
  end

  test do
    assert_match "mdguard", shell_output("#{bin}/mdguard --help")
  end
end
