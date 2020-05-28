#!/bin/bash

set -e

usage="Ansible Script for Setting Up VM

$(basename "$0") [-h] [-i INSTALL_FILES] -f FLOW_NAME

where:
  -h   Show this help text
  -f   Flow name (default: open-source) [adonis|isi|open-source|serdes|tisar]
  -i   Install files folder
  -c   Set Cadence License File
  -s   Set Synopsys License File
  -t   Set Synopsys ID
"

if [ $# -le 2 ]; then
    echo "$usage"
    exit 1
fi

# default variable values
ANSIBLE_DIR=/tmp/ansible
FLOW_FILE=open-source.yml
TOP_DIR=/vault/install
CADENCE_LICENSE_FILE=""
SYNOPSYS_LICENSE_FILE=""
SYNOPSYS_ID=0

# parsing options
while getopts ':h:f:i:c:t:s:' option; do
  case "$option" in
    h) echo "$usage"
       exit
       ;;
    f) FLOW_FILE=$OPTARG.yml
       ;;
    i) TOP_DIR=$OPTARG
       ;;
    c) CADENCE_LICENSE_FILE=$OPTARG
       ;;
    s) SYNOPSYS_LICENSE_FILE=$OPTARG
       ;;
    t) SYNOPSYS_ID=$OPTARG
       ;;
    :) printf "missing argument for -%s\n" "$OPTARG" >&2
       echo "$usage" >&2
       exit 1
       ;;
   \?) printf "illegal option: -%s\n" "$OPTARG" >&2
       echo "$usage" >&2
       exit 1
       ;;
  esac
done
shift $((OPTIND - 1))

cd $ANSIBLE_DIR

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

# exporting environment variables
export ANSIBLE_INSTALL_SOURCE_DIR=$TOP_DIR
export CADENCE_LICENSE_FILE=$CADENCE_LICENSE_FILE
export SYNOPSYS_LICENSE_FILE=$SYNOPSYS_LICENSE_FILE
export SYNOPSYS_ID=$SYNOPSYS_ID

export PATH=$PATH:/usr/local/sbin:/usr/local/bin

# running ansible
ansible-playbook --verbose --connection=local ${FLOW_FILE}
