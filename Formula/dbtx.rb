class Dbtx < Formula
  desc "dbtx CLI (next-gen dbt-style tool)"
  homepage "https://github.com/RAKUDEJI/dbtx"
url "https://github.com/RAKUDEJI/dbtx.git",
    tag: "v0.3.15",
    revision: "fb5ba1b4495f8566d19ca4fc101dc9273e6ba42a"
version "0.3.15"
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
