const hre = require("hardhat");

describe("GAS TEST", function () {
  let gasTest;
  this.beforeEach(async function () {
    const GasTest = await hre.ethers.getContractFactory("GasTest");
    gasTest = await GasTest.deploy();
    gasTest.waitForDeployment();
  });
  it("read", async function () {
    const options = { gasLimit: 1000000 };
    console.log(await gasTest.get(options));
  });

  it("write", async function () {
    const options = { gasLimit: 1000000 };
    console.log(await gasTest.write(2, options));
    console.log(await gasTest.get(options));
  });
});
