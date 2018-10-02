#!/bin/bash

set -e

TOP_DIR=/data/ISI_Karan
ANSIBLE_DIR=/data/ansible

mkdir -p $ANSIBLE_DIR/ansible
cd $ANSIBLE_DIR/ansible
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

ansible-playbook --connection=local local.yml

