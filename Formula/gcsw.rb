class Gcsw < Formula
  desc "Interactive gcloud configuration switcher"
  homepage "https://github.com/arcmanagement/gcsw"
  url "https://github.com/arcmanagement/gcsw/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "0751c063091b841fde18695172c97d8b967703dc0d8ab733c9aec49059e63f45"
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
