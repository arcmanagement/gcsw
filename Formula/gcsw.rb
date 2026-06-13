class Gcsw < Formula
  desc "Interactive gcloud configuration switcher"
  homepage "https://github.com/arcmanagement/gcsw"
  url "https://github.com/arcmanagement/gcsw/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "69054b35a613908eb5744488d734491ef8f337405d192b88b24434bb4a30944b"
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
