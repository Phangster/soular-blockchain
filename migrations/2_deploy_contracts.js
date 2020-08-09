const Energy = artifacts.require("Energy");

module.exports = function(deployer) {
  deployer.deploy(Energy);
};