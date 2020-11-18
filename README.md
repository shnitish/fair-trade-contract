# Supply Chain DAPP

Decentralised application demonstrating supply chain of products between suppliers and buyers.

## Prerequisites

### 1) Solidity compiler
Solc will be used to compile the solidity code to create `abi` and `byte-code` files after compiling, run: 
```
solc -o ../builds --abi --bin /contracts/SupplyChain.sol
```

### 2) Ganache app image or Ganache-cli
To run local ethereum testnet

## Setup

### 1) Create virtual-env
```
 python3 -m venv venv
```
### 2) Install requirements
```
pip install -r requirements.txt
```
### 3) Run
```
Flask run
```