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
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

packages=(
  bat
  cmake
  colordiff
  curl
  deno
  direnv
  exa
  fd
  gawk
  ghq
  gibo
  git
  git-secrets
  httpie
  jid
  jo
  jq
  kubernetes-cli
  mas
  mercurial
  mergepbx
  mysql
  neovim
  nkf
  nmap
  ossp-uuid
  peco
  remarshal
  sqlite
  the_silver_searcher
  tig
  tmux
  translate-shell
  tree
  vim
  wget
  yarn
  z
  zplug
  zsh
)

info "===> Install packages"
brew install ${packages[@]}

cask_packages=(
  alfred
  appcleaner
  caffeine
  docker
  firefox
  gimp
  google-chrome
  google-backup-and-sync
  google-japanese-ime
  gyazo
  inkdrop
  iterm2
  java
  karabiner-elements
  onyx
  qlmarkdown
  sequel-pro
  slack
  spotify
  visual-studio-code
)


info "===> Install Cask packages"
brew cask install ${cask_packages[@]}

fonts=(
  font-camingocode
  font-hackgen
  font-myricam
  font-ricty-diminished
  font-go
)

info "===> Install fonts"
brew cask install ${fonts[@]}

info "===> Clean up"
brew cleanup
