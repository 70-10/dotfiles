#!/bin/bash

cat << 'EOF'
 ____   ___ _____ _____ ___ _     _____ ____
|  _ \ / _ \_   _|  ___|_ _| |   | ____/ ___|
| | | | | | || | | |_   | || |   |  _| \___ \
| |_| | |_| || | |  _|  | || |___| |___ ___) |
|____/ \___/ |_| |_|   |___|_____|_____|____/

EOF

info() {
    echo -e "\033[35m$@\033[m"
}

warn() {
    echo -e "\033[33m$@\033[m"
}

error() {
    echo -e "\033[31m$@\033[m"
}

info "==> Defult Settings"
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 1

info "===> Install Homebrew Packages"
./homebrew/install.sh

info "===> Install Mac App Store"
./mas/install.sh

info "===> Install anyenv"
./anyenv/install.sh

info "==> Install nodebrew and node.js"
./nodebrew/install.sh

info "===> Golang Install Packages"
./golang/get.sh

info "===> Neovim Setting"
./neovim/vim-plug.sh

info "===> Link dotfiles"

DOTFILE_PATH=$(ls -A | grep -e "^\..*" | grep -v ".\(git\|gitignore\|envrc\|config\)$")

for dotfile in ${DOTFILE_PATH[@]}
do
  echo $dotfile
  rm -f $HOME/$dotfile
  Ln -s $(pwd)/$dotfile $HOME/$dotfile
done

CONFIG_DIR=$(ls -A .config)
for config in ${CONFIG_DIR[@]}
do
  echo .config/$config
  rm -rf $HOME/.config/$config
  Ln -s $(pwd)/.config/$config $HOME/.config/$config
done

info "==> VSCode Install extensions"
./vscode/install-extension.sh
