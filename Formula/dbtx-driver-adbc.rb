class DbtxDriverAdbc < Formula
  desc "ADBC runner support for dbtx (installs dbtx-runner-adbc)"
  homepage "https://github.com/RAKUDEJI/dbtx"
url "https://github.com/RAKUDEJI/dbtx.git",
    tag: "v0.3.9",
    revision: "cc21bdd71193d29e172afc007d515ca804304fd3"
version "0.3.9"
  head "https://github.com/RAKUDEJI/dbtx.git", branch: "main"

  depends_on "dbtx"
  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release", "-p", "dbtx-runner",
           "--no-default-features", "--features", "adbc-cli"

    bin.install "target/release/dbtx-runner" => "dbtx-runner-adbc"
  end

  def caveats
    <<~EOS
      This formula installs `dbtx-runner-adbc`.

      To use it, set your environment binding config with:
      - engine: adbc
      - adbc.driver_path: /path/to/your/adbc/driver/library
    EOS
  end

  test do
    system "#{bin}/dbtx-runner-adbc", "--help"
  end
end

