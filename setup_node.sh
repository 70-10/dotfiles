#!/usr/bin/env zsh

title() {
    echo -e "=> \033[33m$@\033[m"
}

info() {
    echo -e "==> \033[32m$@\033[m"
}

title "Install node.js"
if test ! $(which node); then
    info "Installing nodejs at asdf"
    asdf plugin add nodejs
fi

info "node install latest and install npm modules by asdf"
$(PWD)/.zsh.d/functions/Nodebrew/ioup

