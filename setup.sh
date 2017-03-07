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

info "===> Install Homebrew Packages"
./homebrew/install.sh

info "===> Install Mac App Store"
./mas/install.sh

info "===> Install anyenv"
./anyenv/install.sh

info "===> Golang Install Packages"
./golang/get.sh

info "==> Python install packages"
./python/pip.sh

info "===> Link dotfiles"

DOTFILE_PATH=$(ls -A | grep -e "^\..*" | grep -v ".git$" | grep -v ".gitignore$" | grep -v ".envrc")

for dotfile in ${DOTFILE_PATH[@]}
do
  echo $dotfile
  rm -f $HOME/$dotfile
  Ln -s $(pwd)/$dotfile $HOME/$dotfile
done
