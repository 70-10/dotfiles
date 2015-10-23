#!/bin/sh

ansible-playbook -i playbook/hosts/local -t mac playbook/setup.yml
