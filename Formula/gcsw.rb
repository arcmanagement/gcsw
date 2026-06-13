class Gcsw < Formula
  desc "Interactive gcloud configuration switcher"
  homepage "https://github.com/arcmanagement/gcsw"
  url "https://github.com/arcmanagement/gcsw/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "MIT"
  head "https://github.com/arcmanagement/gcsw.git", branch: "main"

  depends_on "fzf"

  def install
    bin.install "gcsw"
    zsh_completion.install "completions/_gcsw"
    pkgshare.install "completions/gcsw.js"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gcsw --version")
  end
end
