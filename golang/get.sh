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

packages=(
  github.com/cjbassi/gotop
  github.com/tj/node-prune
)

export GOPATH=$HOME/dev
export PATH=$GOPATH/bin:$PATH
export GOROOT=${GOENV_ROOT}/versions/$(goenv version)

for pkg in ${packages[@]}
do
  echo $pkg
  GO111MODULE=off go get -u $pkg
done
