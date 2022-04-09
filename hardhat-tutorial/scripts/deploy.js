 const { ethers } = require("hardhat");

 async function main() {
     /**
      A ContractFactory is an abstraction used to deploy new smart contracts,
      so whitelistContract here is a factory for instances of our Whitelist contract.
      */
    const whitelistContract = await ethers.getContractFactory("Whitelist");

    //here we deploy the contract
    const deployedWwhitelistContract = await whitelistContract.deploy(10);
    //10 is the number of whitelisted addresses allowed

    //wait for it to finish deploying
    await deployedWwhitelistContract.deployed();

    //print the address of the deployed contract
    console.log(
        "Whitelist Contract Address:",
        deployedWwhitelistContract.address
    );
 }

 main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });