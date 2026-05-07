#!/usr/bin/env bash
# Bump the Nuntly Homebrew formula to a new version with fresh SHA-256 checksums.
#
# Usage:
#   scripts/update-formula.sh <version> <darwin-arm64-sha> <darwin-x64-sha> <linux-arm64-sha> <linux-x64-sha>
#
# Called by the nuntly-cli release workflow after binaries are uploaded to the
# GitHub Release. Edits Formula/nuntly.rb in place.

set -euo pipefail

if [ $# -ne 5 ]; then
  echo "usage: $0 <version> <darwin-arm64-sha> <darwin-x64-sha> <linux-arm64-sha> <linux-x64-sha>" >&2
  exit 1
fi

VERSION="$1"
DARWIN_ARM64_SHA="$2"
DARWIN_X64_SHA="$3"
LINUX_ARM64_SHA="$4"
LINUX_X64_SHA="$5"

FORMULA="$(dirname "$0")/../Formula/nuntly.rb"

if [ ! -f "$FORMULA" ]; then
  echo "error: formula not found at $FORMULA" >&2
  exit 1
fi

tmp=$(mktemp)

awk -v ver="$VERSION" \
    -v darm="$DARWIN_ARM64_SHA" \
    -v dx="$DARWIN_X64_SHA" \
    -v larm="$LINUX_ARM64_SHA" \
    -v lx="$LINUX_X64_SHA" '
  /^  version "/ {
    print "  version \"" ver "\""
    next
  }
  /on_macos do/ { os = "macos" }
  /on_linux do/ { os = "linux" }
  /on_arm do/   { arch = "arm" }
  /on_intel do/ { arch = "intel" }
  /sha256 "/ {
    if      (os == "macos" && arch == "arm")   { print "      sha256 \"" darm "\""; next }
    else if (os == "macos" && arch == "intel") { print "      sha256 \"" dx   "\""; next }
    else if (os == "linux" && arch == "arm")   { print "      sha256 \"" larm "\""; next }
    else if (os == "linux" && arch == "intel") { print "      sha256 \"" lx   "\""; next }
  }
  { print }
' "$FORMULA" > "$tmp"

mv "$tmp" "$FORMULA"

echo "Updated $FORMULA to version $VERSION"
