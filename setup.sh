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

info "==> Install nodebrew and node.js"
./nodebrew/install.sh

info "===> Golang Install Packages"
./golang/get.sh

info "==> Python install packages"
./python/pip.sh

if ! type circleci > /dev/null 2>&1; then
  info "==> Install CircleCI CLI"
  curl -o /usr/local/bin/circleci https://circle-downloads.s3.amazonaws.com/releases/build_agent_wrapper/circleci && chmod +x /usr/local/bin/circleci
  /usr/local/bin/circleci update
fi

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
