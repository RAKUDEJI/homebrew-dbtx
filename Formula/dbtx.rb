class Dbtx < Formula
  desc "dbtx CLI (next-gen dbt-style tool)"
  homepage "https://github.com/RAKUDEJI/dbtx"
url "https://github.com/RAKUDEJI/dbtx.git",
    tag: "v0.3.9",
    revision: "cc21bdd71193d29e172afc007d515ca804304fd3"
version "0.3.9"
  head "https://github.com/RAKUDEJI/dbtx.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release", "-p", "dbtx-cli"
    system "cargo", "build", "--release", "-p", "dbtx-runner"

    bin.install "target/release/dbtx"
    bin.install "target/release/dbtx-runner"
  end

  test do
    system "#{bin}/dbtx", "--help"
    system "#{bin}/dbtx-runner", "--help"
  end
end
