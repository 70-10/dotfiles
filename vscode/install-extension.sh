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

extensions=(
  christian-kohler.npm-intellisense
  christian-kohler.path-intellisense
  dbaeumer.vscode-eslint
  EditorConfig.EditorConfig
  esbenp.prettier-vscode
  ms-vscode.atom-keybindings
  ms-vscode.go
  PeterJausovec.vscode-docker
  PKief.material-icon-theme
  robinbentley.sass-indented
  WakaTime.vscode-wakatime
)

for ext in ${extensions[@]}
do
  code --install-extension $ext
done
