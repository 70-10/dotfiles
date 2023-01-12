#!/usr/bin/env zsh

title() {
    echo -e "=> \033[33m$@\033[m"
}

info() {
    echo -e "==> \033[32m$@\033[m"
}

title "Install node.js"
if ! (type node > /dev/null 2>&1); then
    info "Installing nodejs at asdf"
    asdf plugin add nodejs
fi

info "node install latest and install npm modules by asdf"
asdf install nodejs lts;
asdf global nodejs lts;
npm cache verify;
npm i -g \
    clipboard-cli \
    corepack \
    eslint \
    fkill-cli \
    np \
    npm-check \
    prettier \
    textlint \
    trash-cli;

