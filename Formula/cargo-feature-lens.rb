class CargoFeatureLens < Formula
  desc "Audit and visualize Cargo dependency feature footprints"
  homepage "https://github.com/billybox1926-jpg/Crate-Feature-Auditor-Visualizer"
  url "https://github.com/billybox1926-jpg/Crate-Feature-Auditor-Visualizer/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "e783e1670790344f0e8ecf5fe2796a2e3ba1001eacc0cb53e829e7b82773e79d"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/cargo-feature-lens --help")
  end
end
