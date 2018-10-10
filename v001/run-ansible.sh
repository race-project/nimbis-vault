#!/bin/bash

set -e

TOP_DIR=/shared/karan/S3sync
ANSIBLE_DIR=/tmp/race-ansible

mkdir -p $ANSIBLE_DIR/
cd $ANSIBLE_DIR/
tar xzf $TOP_DIR/ansible.tar.gz

if ! (which ansible-playbook) >/dev/null 2>&1; then
    # prereqs
    yum -y install \
        PyYAML \
        python-jinja2 \
        python-paramiko \
        python-setuptools \
        python-six \
        python2-crytography \
        sshpass \
        git
    
    # install ansible
    rpm -Uvh packages/rpm/ansible-2.5.4-1.el7.ans.noarch.rpm
fi

cd $ANSIBLE_DIR/v001
ansible-playbook --verbose --connection=local local.yml

