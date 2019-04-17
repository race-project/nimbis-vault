#!/bin/bash

set -e

#change current working directory to adonis_tsmcn16ffc adonis boot up directory
BOOTUP_DIR=/shared/ADONIS_RUN_DIRECTORIES/ADONIS_TSMCN16FFC
WORK_DIR=/shared/$USER/ADONIS_TSMCN16FFC
mkdir -p $WORK_DIR

cp -r $BOOTUP_DIR/* $WORK_DIR/
cd $WORK_DIR

cat <<EOF
Adonis Flow setup for execution from $WORK_DIR .
Execute  the following commands in your terminal to launch Adonis:
cd $WORK_DIR
virtuoso &
EOF


