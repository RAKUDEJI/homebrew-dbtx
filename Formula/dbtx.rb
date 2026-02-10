class Dbtx < Formula
  desc "dbtx CLI (next-gen dbt-style tool)"
  homepage "https://github.com/RAKUDEJI/dbtx"
url "https://github.com/RAKUDEJI/dbtx.git",
    tag: "v0.3.7",
    revision: "83aeb1329de77d7612358df39a9cf8329f9bfbbc"
version "0.3.7"
  head "https://github.com/RAKUDEJI/dbtx.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release", "-p", "dbtx-cli"
    system "cargo", "build", "--release", "-p", "dbtx-runner",
           "--no-default-features", "--features", "duckdb-cli,sqlite-cli"

    bin.install "target/release/dbtx"
    bin.install "target/release/dbtx-runner"
  end

  test do
    system "#{bin}/dbtx", "--help"
    system "#{bin}/dbtx-runner", "--help"
  end
end

