#!/bin/bash

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

