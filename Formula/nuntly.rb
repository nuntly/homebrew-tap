class Nuntly < Formula
  desc "Command-line interface for Nuntly, the developer-first email platform"
  homepage "https://nuntly.com"
  version "1.0.0-alpha.19"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nuntly/nuntly-cli/releases/download/v#{version}/nuntly-darwin-arm64"
      sha256 "16b162a686887dbbbc98eb8323a23eb38bc431e19d7b0cb01e6f5308aa30e9be"
    end
    on_intel do
      url "https://github.com/nuntly/nuntly-cli/releases/download/v#{version}/nuntly-darwin-x64"
      sha256 "c9572f8dab5a73feaa9ee653abd8b969b40b2aea57c7bca161ed999721194fda"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nuntly/nuntly-cli/releases/download/v#{version}/nuntly-linux-arm64"
      sha256 "e65039551342101e399225f21aa38eb3b16ac5e007a4836759a652467d031356"
    end
    on_intel do
      url "https://github.com/nuntly/nuntly-cli/releases/download/v#{version}/nuntly-linux-x64"
      sha256 "dfd52f7a16ab07eda946c83e50846a8c93f40ab83867cd7a2b1ce959fdcebc64"
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
