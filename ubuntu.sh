#!/bin/bash

if ! [ `which ansible` ]; then
  sudo apt-get install software-properties-common -y
  sudo apt-add-repository ppa:ansible/ansible -y
  sudo apt-get update
  sudo apt-get install ansible -y
fi

ansible-playbook -i playbook/hosts/ubuntu -t ubuntu playbook/setup.yml --vault-password-file .vault_pass
