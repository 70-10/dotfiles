#!/bin/sh

if ! [ `which brew` ]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if ! [ `which ansible` ]; then
  brew install ansible
fi

ansible-playbook -i playbook/hosts/mac -t mac playbook/setup.yml --vault-password-file .vault_pass
