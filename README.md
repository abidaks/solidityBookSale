# Solidity Book Sale Smart Contract

This repository contains simple code written in solidity for book sale and web3.js code to interect with the smart contract once you published

## Features of this solidity smart contract.

* After publishing you can sell book on etherum network
* You can set price/update price of book
* You can enable/disable the sale of book
* You can transfer the full or partial amount earned from this contract to your address

## Installing & Running using Ethereum TestRPC
Ethereum TestRPC is a Node.js Ethereum client for the testing and developing smart contracts.

Open up your command line or console and run the following 2 commands:
```
> node -v
> npm -v
```
If either of these commands go unrecognized, go to Nodejs.org and download the appropriate installer and install it

Once finished, close and reload console and re-run the above commands. They should now provide you with version numbers.

Next, let's use NPM to install the Ethereumjs-testrpc:
```
> npm install -g ethereumjs-testrpc
```
Once finished, run command below to start the Ethereum client
```
> testrpc
```
This provides you with 10 different accounts and private keys, along with a local server at http://localhost:8545.

## Installing project dependencies

Call below function in command prompt to install dependencies to run this project
```
> npm install
```
It will install Web3.js which is the official Ethereum Javascript API. You use it to interact with your Ethereum smart contracts.

Once you installed you can connect your Ethereum TestRPC to remix.ethereum.org and publish this smart contract

## Changes to index.html to make it work

Once you uploaded the contract you can get ABI_code (its a long array) from the compiler
```
Line 68: var abi_code = "";
```

Then get the contract address (e.g 0x94a3a54b32c6f07d28f3e5131a8d105fec8e94de) by publishing the BookSale contact
```
Line 71: var cont_addr = '';
```

Now open the index.html page in browser and test it!


## License

* [GNU General Public License](http://www.gnu.org/licenses/)
