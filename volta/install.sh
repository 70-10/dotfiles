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

info "===> node install latest and install npm modules by volta"
$(PWD)/.zsh.d/functions/Nodebrew/ioup
