#!/usr/bin/env zsh

title() {
    echo -e "=> \033[33m$@\033[m"
}

info() {
    echo -e "==> \033[32m$@\033[m"
}

title "Install node.js"
l
info "node install latest and install npm modules by mise"
mise use --global node@lts;
npm cache verify;
npm i -g \
    clipboard-cli \
    npm-check \
    trash-cli;

