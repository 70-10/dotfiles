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

cask_packages=(
  microsoft-excel
  microsoft-teams
  microsoft-powerpoint
  microsoft-word
  onedrive
)


info "===> Install Office packages"
brew install --cask ${cask_packages[@]}

info "===> Clean up"
brew cleanup
