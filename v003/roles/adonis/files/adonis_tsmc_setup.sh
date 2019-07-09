#!/bin/bash

set -e

#change current working directory to adonis_tsmcn16ffc adonis boot up directory
BOOTUP_DIR=/shared/ADONIS_RUN_DIRECTORIES/ADONIS_TSMCN16FFC
WORK_DIR=/shared/$USER/ADONIS_TSMCN16FFC
mkdir -p $WORK_DIR

# copy everything other than .cadence dir and cdslib file
cp -r $BOOTUP_DIR/[^cds.lib]* $WORK_DIR/
cp -r $BOOTUP_DIR/.[^.]*[^cadence]* $WORK_DIR/

# copy cds lib file just once to the work dir
if [ ! -f $WORK_DIR/cds.lib ]; then
    cp $BOOTUP_DIR/cds.lib $WORK_DIR/
fi

cat <<EOF
Adonis Flow setup for execution from $WORK_DIR .
Execute  the following commands in your terminal to launch Adonis:
cd $WORK_DIR
virtuoso &
EOF


