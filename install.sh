#!/usr/bin/env zsh
set -eu
repo="$HOME/dev/src/github.com/70-10/dotfiles"

# Wait for Command Line Tools before invoking Git.
if ! xcode-select -p >/dev/null 2>&1; then
  xcode-select --install
  until xcode-select -p >/dev/null 2>&1; do sleep 5; done
fi

# A new Mac has no SSH key yet.
[ -d "$repo" ] || git clone https://github.com/70-10/dotfiles.git "$repo"

# Install the brew command; mise manages the package list.
if [ ! -x /opt/homebrew/bin/brew ]; then
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"

# Use the official mise installer.
[ -x "$HOME/.local/bin/mise" ] || curl -fsSL https://mise.run | sh
export PATH="$HOME/.local/bin:$PATH"
export MISE_GLOBAL_CONFIG_FILE="$repo/.config/mise/config.toml"

# Install formulae (including mas) first, then bootstrap without links.
mise bootstrap packages apply --manager brew
mise bootstrap --skip dotfiles

# Create links last so conflicts do not block the other bootstrap phases.
mise dotfiles apply || {
  print -u2 "リンク先に既存のファイルがあります。既存のファイルを退避してから再実行してください"
  exit 1
}
