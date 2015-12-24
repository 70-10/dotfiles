#!/bin/sh

if [[ $1 == *.go ]] && [ `which goimports` ]; then
  goimports -w $1
fi
