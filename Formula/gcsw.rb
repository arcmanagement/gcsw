class Gcsw < Formula
  desc "Interactive gcloud configuration switcher"
  homepage "https://github.com/arcmanagement/gcsw"
  url "https://github.com/arcmanagement/gcsw/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "fbdee78121f11812d4a26e0691e572d4de2702e0ea2061e3c6f2fb27b6f9caee"
  license "MIT"
  head "https://github.com/arcmanagement/gcsw.git", branch: "main"

  depends_on "fzf"

  def install
    bin.install "gcsw"
    zsh_completion.install "completions/_gcsw"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gcsw --version")
  end
end
