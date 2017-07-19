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
  christian-kohler.path-intellisense
  dbaeumer.vscode-eslint
  EditorConfig.EditorConfig
  esbenp.prettier-vscode
  flowtype.flow-for-vscode
  gluons.vscode-atom-javascript-snippet
  lukehoban.Go
  ms-vscode.atom-keybindings
  octref.vetur
  PeterJausovec.vscode-docker
  PKief.material-icon-theme
  taichi.vscode-textlint
  WakaTime.vscode-wakatime
)

for ext in ${extensions[@]}
do
  code --install-extension $ext
done
