class TerraformPlanParser < Formula
  desc "Lightweight CLI that turns Terraform plan JSON into clean summaries"
  homepage "https://github.com/billybox1926-jpg/terraform-plan-parser"
  url "https://github.com/billybox1926-jpg/terraform-plan-parser/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "cd752a798d036b543bb091ec6a70c3e9c877356846d884ee39283c1537a71a62"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "terraform_plan_parser", shell_output("#{bin}/terraform_plan_parser --version")
  end
end
