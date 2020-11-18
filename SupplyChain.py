import json
from web3 import Web3

ganache = "http://127.0.0.1:8545"
web3 = Web3(Web3.HTTPProvider(ganache))

web3.eth.defaultAccount = web3.eth.accounts[0]

def deploy_contract():

    # deploy smart contract to the local ethereum ganache blockchain
    with open('builds/SupplyChain.abi') as a, open('builds/SupplyChain.bin') as b:
        abi = json.load(a)
        byte_code = ''.join(b)
    
    supplyChain = web3.eth.contract(abi = abi, bytecode = byte_code)

    # default constructor called from the solidity code
    tx_hash = supplyChain.constructor().transact() 
    tx_receipt = web3.eth.waitForTransactionReceipt(tx_hash)
    contract = web3.eth.contract(address = tx_receipt.contractAddress, abi = abi)

    # called a function for testing to get count of orders placed
    print(contract.functions.getOrdersLength().call())

deploy_contract()


