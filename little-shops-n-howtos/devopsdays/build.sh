#!/bin/bash -eu
cd $( dirname $0 )
. ansiblerc
cat ansiblerc
echo ANSINV=$ANSIBLE_INVENTORY
cat $ANSIBLE_INVENTORY
ansible-playbook configure-rainbow.yml
