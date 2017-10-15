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
  github.com/alecthomas/gometalinter
  github.com/golang/lint/golint
  github.com/mattn/memo
  github.com/mattn/qq/cmd/qq
  github.com/motemen/gore
  github.com/nsf/gocode
  github.com/pilu/fresh
  github.com/rogpeppe/godef
  golang.org/x/tools/cmd/godoc
  golang.org/x/tools/cmd/goimports
  golang.org/x/tools/cmd/gorename
  golang.org/x/tools/cmd/guru
)

export GOPATH=$HOME/dev
export PATH=$GOPATH/bin:$PATH
export GOROOT=${GOENV_ROOT}/versions/$(goenv version)

for pkg in ${packages[@]}
do
  echo $pkg
  go get -u $pkg
done
