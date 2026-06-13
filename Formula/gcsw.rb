class Gcsw < Formula
  desc "Interactive gcloud configuration switcher"
  homepage "https://github.com/arcmanagement/gcsw"
  url "https://github.com/arcmanagement/gcsw/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "556b6a0c6f9f9d7b41feb9fd47b31d82c59eaf8feb849c8eb124461f523b2ba3"
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
