var LogicOne = artifacts.require("./LogicOne.sol");
var Registry = artifacts.require("./Registry.sol");

module.exports = function(deployer) {

  deployer.then(async () => {
    let ins = await Registry.deployed();
    let storage_contract = await ins.storage_contract();
    await deployer.deploy(LogicOne, storage_contract);
  })

};
