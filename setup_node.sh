#!/bin/zsh

info() {
    echo -e "\033[35m$@\033[m"
}

warn() {
    echo -e "\033[33m$@\033[m"
}

error() {
    echo -e "\033[31m$@\033[m"
}

info "==> Install node.js"
./asdf/nodejs.sh
