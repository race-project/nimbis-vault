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
  -r   Run method (default: local) [local|packer]
"

if [ $# -le 1 ]; then
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
RUN_METHOD=local

# parsing options
while getopts ':h:f:i:c:t:s:r:' option; do
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
    r) RUN_METHOD=$OPTARG
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

### If running through Packer
if [ "$RUN_METHOD" == "packer" ]; then
    cd $ANSIBLE_DIR
fi

if [ ! -f $FLOW_FILE ]; then
    echo -e "Unsupported flow. File $FLOW_FILE does not exist"
    exit 1
fi

#### If running locally to test
if [ "$RUN_METHOD" == "local" ]; then
    mkdir -p $ANSIBLE_DIR/
    cd $ANSIBLE_DIR/
    tar xzf $TOP_DIR/ansible.tar.gz
fi

# install ansible
if ! (which ansible-playbook) >/dev/null 2>&1; then
    # prereqs
    yum install -y python3 python3-pip

    # install ansible
    pip3 install ansible
fi

# exporting environment variables
export ANSIBLE_INSTALL_SOURCE_DIR=$TOP_DIR
export CADENCE_LICENSE_FILE=$CADENCE_LICENSE_FILE
export SYNOPSYS_LICENSE_FILE=$SYNOPSYS_LICENSE_FILE
export SYNOPSYS_ID=$SYNOPSYS_ID

export PATH=$PATH:/usr/local/sbin:/usr/local/bin

# running ansible
ansible-playbook --verbose --connection=local -i inventory/hosts.yml ${FLOW_FILE}

if [ "$RUN_METHOD" == "packer" ]; then
  rm -rf $ANSIBLE_DIR
fi

