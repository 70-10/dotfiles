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

packages=(
  1024640650 # CotEditor
  1333542190  # 1password
  441258766 # Magnet
)

info "===> Install app at Mac App Store"
mas install ${packages[@]}
