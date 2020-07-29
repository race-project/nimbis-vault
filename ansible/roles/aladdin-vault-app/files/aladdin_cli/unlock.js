//!/bin/node

const W3 = require('web3');
const readline = require('readline');
const fs = require('fs');
const path = require('path');

let wallet = JSON.parse(process.argv[2]);

var rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.stdoutMuted = true;

rl.question('Password: ', function(password) {
  let web3 = new W3(new W3.providers.HttpProvider('http://<eth_ip>:8545'));
  let acct = web3.eth.accounts.decrypt(wallet, password);
 
  console.log('\n', {address:acct.address, privateKey:acct.privateKey});

  rl.history = rl.history.slice(1);
  rl.close();
});

rl._writeToOutput = function _writeToOutput(stringToWrite) {
  if (!rl.stdoutMuted) {
    rl.output.write(stringToWrite);
  } else {
    rl.output.write('*');
  }
};

