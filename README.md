[![Platform](https://img.shields.io/badge/Platform-Ethereum-blue.svg)](https://en.wikipedia.org/wiki/Ethereum)
[![Platform](https://img.shields.io/badge/Solidity-v0.5.10-red)](https://docs.soliditylang.org/en/v0.5.10/contracts.html)
[![Platform](https://img.shields.io/badge/Truffle-v5.1.53-yellowgreen)](https://www.trufflesuite.com/)
[![Platform](https://img.shields.io/badge/OS-Linux-yellow.svg)](https://archlinux.org/)


# Fair Trade smart-contract

Smart contract deployed on ethereum blockchain network which acts as intermediary between two parties to overcome trust issues and perform fair trade between them.

The smart contract is based on the use case of seller and buyer to support commercial transactions. The seller deploys the smart contract to the blockchain and buyers place orders using contract functions, seller sends the confirmation regarding the details of the product and delivery charges to buyer. The buyer confirms the order and payout to the contract. Seller then initiates a shipment with the details regarding the product and charges. The seller and courier was paid out by the contract at the end of the delivery.

## Setup
[1) Install soldity compiler: ](https://docs.soliditylang.org/en/v0.5.10/installing-solidity.html) `npm install solc`

[2) Install truffle framework: ](https://www.trufflesuite.com/docs/truffle/getting-started/installation) `npm install -g truffle`

[3) Install ganache app image or ganache-cli](https://www.trufflesuite.com/docs/ganache/quickstart)

## Usage
1) Clone the project
`git clone git@github.com:nitish81299/supply-chain.git`
2) Run ganche-cli in a seperate terminal window or use app image and create a workspace running on port `8545`
3) To compile smart contract run: `truffle compile`
4) Deploy contract to local blockchain running on ganache by: `truffle migrate`   

## To-Do
- Write tests
- Create UI to interact with smart contract
