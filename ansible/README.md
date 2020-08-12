# Ansible scripts to set up Vault VM

This document provides installation instructions on how to deploy a Vault VM using our set of scripts.

The Vault VM automates the installation and configuration of design flows, its required software, and an additional set of tools for collaborative development.

---

## Creating a Vault VM

```
$ bash run-ansible.sh -h
Ansible Script for Setting Up VM

run-ansible.sh [-h] [-i INSTALL_FILES] -f FLOW_NAME

where:
  -h   Show this help text
  -f   Flow/role name (default: open-source) [adonis|isi|open-source|serdes|tisar|base-os]
  -i   Install files folder
  -c   Set Cadence License File
  -s   Set Synopsys License File
  -t   Set Synopsys ID
  -r   Run method (default: local) [local|packer]
```

For example (for running locally/manually):

```
$ bash run-ansible.sh -f open-source -r local -i /tmp/ansible/install-files
```

For example (for running through Packer):
```
$ bash run-ansible.sh -f open-source -r packer -i /tmp/ansible/install-files
```

