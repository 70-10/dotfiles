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

if test ! $(which brew); then
    info "===> Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

packages=(
  jmeter
  ossp-uuid
)

info "===> Install packages"
brew install ${packages[@]}

cask_packages=(
  postman
)

info "===> Install Cask packages"
brew install --cask ${cask_packages[@]}

info "===> Clean up"
brew cleanup
