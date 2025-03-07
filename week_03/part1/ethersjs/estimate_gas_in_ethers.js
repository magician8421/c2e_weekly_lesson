const hre = require("hardhat");

describe("GAS TEST", function () {
  let gasTest;
  this.beforeEach(async function () {
    const GasTest = await hre.ethers.getContractFactory("GasTest");
    gasTest = await GasTest.deploy();
    gasTest.waitForDeployment();
  });
  it("read", async function () {
    console.log(await gasTest.get.estimateGas());
  });

  it("write", async function () {});
});
