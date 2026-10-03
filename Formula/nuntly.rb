class Nuntly < Formula
  desc "Command-line interface for Nuntly, the developer-first email platform"
  homepage "https://nuntly.com"
  version "1.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nuntly/nuntly-cli/releases/download/v#{version}/nuntly-darwin-arm64"
      sha256 "bee0ee47c1a9df0e6d83af0d2e69060f3e95f847b62bf7cc1f3f2e47dcd5ea96"
    end
    on_intel do
      url "https://github.com/nuntly/nuntly-cli/releases/download/v#{version}/nuntly-darwin-x64"
      sha256 "bd2424a0058d0cd29f0e124161f33f1bf94d5d09f7b7ec14f95399d32cade325"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nuntly/nuntly-cli/releases/download/v#{version}/nuntly-linux-arm64"
      sha256 "a5876d699e5d80b80ca72b2da02a7f2f340f8a76ef741e5733f2279cf7a8d00b"
    end
    on_intel do
      url "https://github.com/nuntly/nuntly-cli/releases/download/v#{version}/nuntly-linux-x64"
      sha256 "5ba95eafeda397630cbf5358f204e18e75ec5c4ad4d1e8d51ddc92a544fcb3b5"
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
