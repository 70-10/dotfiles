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

if test ! $(which nodebrew); then
    info "===> Installing nodebrew"
    curl -L git.io/nodebrew | perl - setup
fi

export PATH=$HOME/.nodebrew/current/bin:$PATH

info "===> nodebrew install latest and install npm modules"
$(PWD)/.zsh.d/functions/Nodebrew/ioup
