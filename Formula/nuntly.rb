class Nuntly < Formula
  desc "Command-line interface for Nuntly, the developer-first email platform"
  homepage "https://nuntly.com"
  version "2.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nuntly/nuntly-cli/releases/download/v#{version}/nuntly-darwin-arm64"
      sha256 "f14e05a5073a6ccf64bf515071257a1e7e70f137c00f4e2553646514ff07c6a2"
    end
    on_intel do
      url "https://github.com/nuntly/nuntly-cli/releases/download/v#{version}/nuntly-darwin-x64"
      sha256 "324418c81d6e28d5d408b89038705ce53b68e89ccfdaf3f9c595bed8fe7a6ec9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nuntly/nuntly-cli/releases/download/v#{version}/nuntly-linux-arm64"
      sha256 "fb9090e05083f011fe06798959e9f1d0db75132d7f9f9aba9f4555dd12095d5f"
    end
    on_intel do
      url "https://github.com/nuntly/nuntly-cli/releases/download/v#{version}/nuntly-linux-x64"
      sha256 "003dde403f7c3490240c209500dfc9a0c03b6b06501c93d3dfa643ed08e59ff2"
    end
  end

  def install
    bin.install Dir["*"].first => "nuntly"

    # `nuntly completion <shell>` outputs a static completion script that does
    # not require config. Homebrew picks the right destination directory per
    # shell automatically.
    generate_completions_from_executable(bin/"nuntly", "completion", shells: [:bash, :zsh, :fish])
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nuntly --version")
    assert_match "_nuntly", shell_output("#{bin}/nuntly completion bash")
  end
end
