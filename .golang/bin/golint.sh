#!/bin/sh

if [[ $1 == *.go ]] && [ `which golint` ]; then
  golint $1
fi
