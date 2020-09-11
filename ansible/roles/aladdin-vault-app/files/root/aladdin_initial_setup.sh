#!/bin/bash

cd /usr/lib/aladdin-vault-api
    
export ETH_VM_IP=$(cat /tmp/ethereum_ip.txt || sed 's/ *$//g')
export IPFS_VM_IP=$(cat /tmp/ipfs_ip.txt || sed 's/ *$//g')
export KEY_FILENAME=$(curl $ETH_VM_IP/priveth/chaindata/keystore/ | grep -Po '(UTC[^"]*)')
curl $ETH_VM_IP/priveth/chaindata/keystore/$KEY_FILENAME > keyfile.json
echo "RACECRAFT" | node utils/unlock.js `cat ./keyfile.json` &> tmpkey
export TMPKEY=`cat tmpkey | grep -oP "0x[0-9a-zA-Z]+" | tail -n 1`
export ETHERBASE=$(curl $ETH_VM_IP/priveth/account |grep -oP "0x[0-9a-zA-Z]+")

sed -i "s/0x0000000000000000000000000000000000000000000000000000000000000000/$TMPKEY/" ./config/local.json
sed -i "s/0x0000000000000000000000000000000000000000/$ETHERBASE/" ./config/local.json
sed -i "s/ipfs_vm_ip/$IPFS_VM_IP/" ./config/local.json
sed -i "s/eth_vm_ip/$ETH_VM_IP/" ./config/local.json

sed -i "s/0x0000000000000000000000000000000000000000000000000000000000000000/$TMPKEY/" /usr/lib/aladdin-vault-cli/.config.json
sed -i "s/0x0000000000000000000000000000000000000000/$ETHERBASE/" /usr/lib/aladdin-vault-cli/.config.json
sed -i "s/<eth_ip>/$ETH_VM_IP/" /usr/lib/aladdin-vault-cli/.config.json

node utils/deploy.js

export CONTRACT_ADDRESS=`cat config/local.json | grep "contract_address" | grep -oP "0x[0-9a-zA-Z]+"`
export CONTRACT_BLOCK=`cat config/local.json | grep "contract_block" | grep -oP "0x[0-9a-zA-Z]+"`

sed -i "s/<contract_address>/$CONTRACT_ADDRESS/" /usr/lib/aladdin-vault-cli/.config.json
sed -i "s/<contract_block>/$CONTRACT_BLOCK/" /usr/lib/aladdin-vault-cli/.config.json
sed -i "s/\"publicKey\": \"\"/\"publicKey\": \"$ETHERBASE\"/" /usr/lib/aladdin-vault-cli/.config.json
sed -i "s/\"privateKey\": \"\"/\"privateKey\": \"$TMPKEY\"/" /usr/lib/aladdin-vault-cli/.config.json

supervisorctl restart devapi && sleep 7 && node utils/uploadInitialFlow.js