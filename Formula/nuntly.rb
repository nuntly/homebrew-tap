class Nuntly < Formula
  desc "Command-line interface for Nuntly, the developer-first email platform"
  homepage "https://nuntly.com"
  version "1.0.0-alpha.20"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nuntly/nuntly-cli/releases/download/v#{version}/nuntly-darwin-arm64"
      sha256 "1eaac49d535e350a7d2169844a54af6611f073eda778ac9a220042b80aeedd26"
    end
    on_intel do
      url "https://github.com/nuntly/nuntly-cli/releases/download/v#{version}/nuntly-darwin-x64"
      sha256 "d1b7a100a9b8dd8a1e62137783c6851576f1245e9ad47728c9e35fff40539083"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nuntly/nuntly-cli/releases/download/v#{version}/nuntly-linux-arm64"
      sha256 "3dd179e778ba796db5fcfad65827c189584035d2e737f3f3ceeb689c36fc7127"
    end
    on_intel do
      url "https://github.com/nuntly/nuntly-cli/releases/download/v#{version}/nuntly-linux-x64"
      sha256 "08852297e878f8315122d716f9e530d9505abd3ca729696ecf5234b23b7e02b9"
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
