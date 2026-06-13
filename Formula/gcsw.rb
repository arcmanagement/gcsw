class Gcsw < Formula
  desc "Interactive gcloud configuration switcher"
  homepage "https://github.com/arcmanagement/gcsw"
  url "https://github.com/arcmanagement/gcsw/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "bdd798a4e9dbd61edee823121d2060f7ee0fbdd57a0f5a020b9438b39d525881"
  license "MIT"
  head "https://github.com/arcmanagement/gcsw.git", branch: "main"

  depends_on "fzf"

  def install
    bin.install "gcsw"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gcsw --version")
  end
end
