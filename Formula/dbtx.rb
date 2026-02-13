class Dbtx < Formula
  desc "dbtx CLI (next-gen dbt-style tool)"
  homepage "https://github.com/RAKUDEJI/dbtx"
url "https://github.com/RAKUDEJI/dbtx.git",
    tag: "v0.0.1-alpha.1",
    revision: "b05164e0575ec8546c70526074cc6b435b0163df"
version "0.0.1-alpha.1"
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
