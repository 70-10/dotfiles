#!/bin/bash

cat << 'EOF'
 ____        _    __ _ _
|  _ \  ___ | |_ / _(_) | ___  ___
| | | |/ _ \| __| |_| | |/ _ \/ __|
| |_| | (_) | |_|  _| | |  __/\__ \
|____/ \___/ \__|_| |_|_|\___||___/

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

info "===> Golang Install Packages"
./golang/get.sh



info "===> Link dotfiles"

DOTFILE_PATH=$(ls -A | grep -e "^\..*" | grep -v ".git/$" | grep -v ".gitignore$")

for dotfile in ${DOTFILE_PATH[@]}
do
  echo $dotfile
  rm -f $HOME/$dotfile
  Ln -s $(pwd)/$dotfile $HOME/$dotfile
done
