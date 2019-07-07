#!/bin/bash -eu
playbooks_dir="$( dirname $0)"
cd $playbooks_dir
. ansiblerc
target="all"
# target="webservers"
ansible-playbook add-admins.yml --extra-vars="target=$target"
