class DbtxDriverSnowflake < Formula
  desc "Snowflake runner support for dbtx (installs dbtx-runner-snowflake)"
  homepage "https://github.com/RAKUDEJI/dbtx"
url "https://github.com/RAKUDEJI/dbtx.git",
    tag: "v0.0.1-alpha.1",
    revision: "b05164e0575ec8546c70526074cc6b435b0163df"
version "0.0.1-alpha.1"
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
