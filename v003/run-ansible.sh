#!/bin/bash

set -e

if [ $# -ne 1 ]; then
    echo -e "Usage: $0 <flow-name>. Supported flows [adonis|isi|serdes|tisar]"
    exit 1
fi

FLOW_FILE=$1.yml


TOP_DIR=/shared/karan/S3sync
ANSIBLE_DIR=/tmp/race-ansible

mkdir -p $ANSIBLE_DIR/
cd $ANSIBLE_DIR/
tar xzf $TOP_DIR/ansible.tar.gz

cd $ANSIBLE_DIR/v003

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
    rpm -Uvh packages/rpm/ansible-2.7.1-1.el7.ans.noarch.rpm
fi

if [ ! -f $FLOW_FILE ]; then
    echo -e "Unsupported flow. File $FLOW_FILE does not exist"
    exit 1
fi

ansible-playbook --verbose --connection=local ${FLOW_FILE}
