var LogicTwo = artifacts.require("./LogicTwo.sol");

module.exports = function(deployer) {
  deployer.deploy(LogicTwo);
  /**
  deployer.then(async () => {
    let s = await Storage.deployed();
    await deployer.deploy(LogicOne, s);
  })
  */
};
