class Acf < Formula
  desc "Source-code fingerprinting and similarity search CLI"
  homepage "https://github.com/ExeconOne/any-code-fingerprint"
  version "0.1.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ExeconOne/any-code-fingerprint/releases/download/v0.1.14/acf-macos-arm64.tar.gz"
      sha256 "3e4bc110378b5404201379a0ccc2147d8245cc5944802b5e0d82033cfac27963"
    else
      odie "acf: no pre-built binary for macOS Intel yet"
    end
  end

  on_linux do
    url "https://github.com/ExeconOne/any-code-fingerprint/releases/download/v0.1.14/acf-linux-x64.tar.gz"
    sha256 "17e637d958ff945d4a548ce06f463939eb42ba0e2fe98ebcb8d71bad80f05e2b"
  end

  def install
    bin.install Dir["acf-*"].first => "acf"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/acf --version")
  end
end
