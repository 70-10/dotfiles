#!/bin/bash

info() {
    echo -e "\033[35m$@\033[m"
}

warn() {
    echo -e "\033[33m$@\033[m"
}

error() {
    echo -e "\033[31m$@\033[m"
}

if test ! $(which anyenv); then
    info "===> Installing anyenv"
    git clone https://github.com/riywo/anyenv $HOME/.anyenv
    mkdir $HOME/.anyenv/plugins
    git clone https://github.com/znz/anyenv-update.git $HOME/.anyenv/plugins/anyenv-update
    git clone https://github.com/znz/anyenv-git.git $HOME/.anyenv/plugins/anyenv-git
fi

envs=(
  goenv
  rbenv
  pyenv
)

info "===> Install envs"
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
for env in ${envs[@]}
do
  info "=====> Install $env"
  anyenv install $env --skip-existing
done


GOVERSION=1.12.3
info "===> goenv install $GOVERSION"
if [ -d $HOME/.anyenv/envs/goenv/versions/$GOVERSION ]; then
  info "$GOVERSION is already installed"
else
  goenv install $GOVERSION
  goenv global $GOVERSION
fi

PYTHONVERSION=3.7.1
info "===> pyenv install $PYTHONVERSION"
if [ -d $HOME/.anyenv/envs/pyenv/versions/$PYTHONVERSION ]; then
  info "$PYTHONVERSION is already installed"
else
  pyenv install $PYTHONVERSION
  pyenv global $PYTHONVERSION
  pyenv rehash
fi
