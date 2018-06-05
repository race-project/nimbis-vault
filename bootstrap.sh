#!/bin/bash

set -e

# prereqs
yum -y install \
    PyYAML \
    python-jinja2 \
    python-paramiko \
    python-setuptools \
    python-six \
    python2-crytography \
    sshpass

# install ansible
rpm -Uvh http://releases.ansible.com/ansible/rpm/release/epel-7-x86_64/ansible-2.5.4-1.el7.ans.noarch.rpm

ansible-pull -U https://github.com/pegasus-isi/race-vm.git

