var Trade = artifacts.require("Trade");

module.exports = function(deployer, network, accounts){
  deployer.deploy(Trade, accounts[0]);
};
