class Nuntly < Formula
  desc "Command-line interface for Nuntly, the developer-first email platform"
  homepage "https://nuntly.com"
  version "1.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nuntly/nuntly-cli/releases/download/v#{version}/nuntly-darwin-arm64"
      sha256 "8c2500228cf9cce79ac6bf71f0e593655cb7c35c1e310d52f87a4652161e1210"
    end
    on_intel do
      url "https://github.com/nuntly/nuntly-cli/releases/download/v#{version}/nuntly-darwin-x64"
      sha256 "6ede9fb7773c13f633ea597251f2d328a3123880ff73661707593b2a5fbb9077"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nuntly/nuntly-cli/releases/download/v#{version}/nuntly-linux-arm64"
      sha256 "f568b744e9164a8ca7881942bc0d655d298d5a67e2b9a09c9631dbea5f50b838"
    end
    on_intel do
      url "https://github.com/nuntly/nuntly-cli/releases/download/v#{version}/nuntly-linux-x64"
      sha256 "a4f6293ef65eee8fd79b6d37978d14067108cd665297c172ddad3604ac223da4"
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
