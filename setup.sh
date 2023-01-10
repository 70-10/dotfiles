#!/bin/zsh

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
rm -f $HOME/.Brewfile
Ln -s $(pwd)/.Brewfile $HOME/.Brewfile
./homebrew/install.sh

info "===> Neovim Setting"
./neovim/vim-plug.sh

info "===> Link dotfiles"

for dotfile in $(ls -A | grep -e "^\..*" | grep -v ".\(git\|gitignore\|envrc\|config\)$")
do
  echo $dotfile
  rm -f $HOME/$dotfile
  Ln -s $(pwd)/$dotfile $HOME/$dotfile
done

for config in $(ls -A .config)
do
  echo .config/$config
  rm -rf $HOME/.config/$config
  Ln -s $(pwd)/.config/$config $HOME/.config/$config
done
