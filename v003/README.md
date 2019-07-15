# CRAFT Vault

This document provides installation instructions on how to deploy a CRAFT Vault VM using our set of scripts.

The CRAFT Vault VM automates the installation and configuration of design flows, its required software, and an additional set of tools for collaborative development.

---

## Pre-Requisites

### Common Dependencies

### Demo ISI Design Flow

### Adonis Design Flow

### BAG SERDES Design Flow

### BAG TISAR Design Flow

---

## Creating a CRAFT Vault VM

```
$ bash run-ansible.sh -h
Ansible Script for Setting Up RACE VM

run-ansible.sh [-h] [-i SYNOPSYS_ID] FLOW_NAME

where:
  -h   Show this help text
  -f   Flow name (default: isi) [adonis|isi|serdes|tisar]
  -i   Install files folder
  -c   Set Cadence License File
  -s   Set Synopsys License File
  -t   Set Synopsys ID
```

For example:

```
$ bash run-ansible.sh -f isi -i /shared/install-files
```
