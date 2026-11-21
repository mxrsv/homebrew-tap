# mxrsv/tap

Homebrew casks for [TinySift](https://tinysift.app), a free Mac app that shows what fills your disk and frees what you pick.

```bash
brew install --cask mxrsv/tap/tinysift
```

Apple silicon, macOS 14 or later. The app updates itself through Sparkle; this cask follows each release on
[GitHub](https://github.com/mxrsv/tinysift/releases).

## Command-line tool

The open-source `sift` command, without the app:

```bash
brew install --cask mxrsv/tap/tinysift-cli
sift clean --dry-run
```

`sift` and `tinysift` are the same tool. If another `sift` is already on your Mac, the cask leaves it
alone and you type `tinysift` instead. Update with `brew upgrade --cask mxrsv/tap/tinysift-cli`.
