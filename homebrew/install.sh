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

printf "Update recipes? [Y/n]: " && read ANS
if [ "${ANS}" = "Y" ]; then
    brew update
fi

packages=(
  ansible
  awscli
  aws-shell
  bash
  cmake
  curl
  dep
  direnv
  gawk
  ghq
  gibo
  git
  git-secrets
  gradle
  httpie
  hub
  hugo
  jid
  jo
  jq
  mas
  mercurial
  mergepbx
  mysql
  neovim
  nkf
  nmap
  peco
  remarshal
  sqlite
  the_silver_searcher
  tig
  tmux
  translate-shell
  tree
  typesafe-activator
  vim
  wget
  yarn
  z
  zplug
  zsh
  zsh-completions
)

info "===> Install packages"
brew install ${packages[@]} && brew cleanup

cask_packages=(
  alfred
  android-studio
  appcleaner
  atom
  caffeine
  docker
  dropbox
  eclipse-jee
  evernote
  firefox
  gogland
  google-chrome
  google-chrome-canary
  google-drive
  google-japanese-ime
  gyazo
  intellij-idea-ce
  iterm2
  java
  karabiner
  libreoffice
  marp
  onyx
  pycharm-ce
  qlmarkdown
  rdm
  sequel-pro
  skitch
  slack
  skype
  sourcetree
  spotify
  vagrant
  vagrant-manager
  virtualbox
  visual-studio-code
)


info "===> Install Cask packages"
brew tap caskroom/fonts
brew cask install ${cask_packages[@]} && brew cask cleanup

fonts=(
  font-camingocode
  font-ricty-diminished
  font-go
)

info "===> Install fonts"
brew cask install ${fonts[@]} && brew cask cleanup
