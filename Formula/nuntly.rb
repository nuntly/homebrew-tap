class Nuntly < Formula
  desc "Command-line interface for Nuntly, the developer-first email platform"
  homepage "https://nuntly.com"
  version "0.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nuntly/nuntly-cli/releases/download/v#{version}/nuntly-darwin-arm64"
      sha256 "REPLACE_WITH_DARWIN_ARM64_SHA256"
    end
    on_intel do
      url "https://github.com/nuntly/nuntly-cli/releases/download/v#{version}/nuntly-darwin-x64"
      sha256 "REPLACE_WITH_DARWIN_X64_SHA256"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nuntly/nuntly-cli/releases/download/v#{version}/nuntly-linux-arm64"
      sha256 "REPLACE_WITH_LINUX_ARM64_SHA256"
    end
    on_intel do
      url "https://github.com/nuntly/nuntly-cli/releases/download/v#{version}/nuntly-linux-x64"
      sha256 "REPLACE_WITH_LINUX_X64_SHA256"
    end
  end

  def install
    bin.install Dir["*"].first => "nuntly"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nuntly --version")
  end
end
