# nuntly/homebrew-tap

Homebrew tap for [Nuntly](https://nuntly.com) command-line tools.

## Install

```bash
brew install nuntly/tap/nuntly
```

## How updates work

This repo is updated automatically by the `nuntly/nuntly-cli` release workflow:

1. CLI release builds the binaries and uploads them to a GitHub Release.
2. CLI release computes SHA-256 checksums.
3. CLI release clones this repo, runs `scripts/update-formula.sh`, opens a PR.
4. A maintainer merges the PR. The new version becomes available via `brew upgrade nuntly`.

No CI runs in this repo. The merge to `main` is the release.

## Manual update (rare)

```bash
./scripts/update-formula.sh 1.2.3 \
  <darwin-arm64-sha256> \
  <darwin-x64-sha256> \
  <linux-arm64-sha256> \
  <linux-x64-sha256>
```
