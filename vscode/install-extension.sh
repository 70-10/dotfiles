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
  shan.code-settings-sync
)

for ext in ${extensions[@]}
do
  code --install-extension $ext
done
