class Mdguard < Formula
  desc "Tiny, dependency-free Markdown lint guardrails"
  homepage "https://github.com/billybox1926-jpg/mdguard"
  url "https://github.com/billybox1926-jpg/mdguard/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "d6b641f8ed50c34c6c90591818229ac05038d34eceb54f048ea7af426c276dba"
  license "MIT"

  depends_on "python@3.12"

  def install
    system "python3", "-m", "pip", "install",
           "--prefix=#{libexec}",
           "--no-deps", "--no-compile",
           "."
    bin.install libexec/"bin/mdguard"
  end

  test do
    assert_match "mdguard", shell_output("#{bin}/mdguard --help")
  end
end
