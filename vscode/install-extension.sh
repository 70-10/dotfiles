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
  codezombiech.gitignore
  dbaeumer.vscode-eslint
  EditorConfig.EditorConfig
  eg2.vscode-npm-script
  esbenp.prettier-vscode
  gluons.vscode-atom-javascript-snippet
  ms-vscode.atom-keybindings
  ms-vscode.go
  octref.vetur
  PeterJausovec.vscode-docker
  PKief.material-icon-theme
  robinbentley.sass-indented
  WakaTime.vscode-wakatime
  wayou.vscode-todo-highlight
)

for ext in ${extensions[@]}
do
  code --install-extension $ext
done
