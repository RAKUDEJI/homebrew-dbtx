class DbtxDriverSnowflake < Formula
  desc "Snowflake runner support for dbtx (installs dbtx-runner-snowflake)"
  homepage "https://github.com/RAKUDEJI/dbtx"
url "https://github.com/RAKUDEJI/dbtx.git",
    tag: "v0.3.9",
    revision: "cc21bdd71193d29e172afc007d515ca804304fd3"
version "0.3.9"
  head "https://github.com/RAKUDEJI/dbtx.git", branch: "main"

  depends_on "dbtx"
  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release", "-p", "dbtx-runner"

    bin.install "target/release/dbtx-runner" => "dbtx-runner-snowflake"
  end

  def caveats
    <<~EOS
      This formula installs `dbtx-runner-snowflake`.

      You also need SnowSQL available on PATH (default: `snowsql`).
    EOS
  end

  test do
    system "#{bin}/dbtx-runner-snowflake", "--help"
  end
end
