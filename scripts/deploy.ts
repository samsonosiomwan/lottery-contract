import { ethers } from "hardhat";

async function main() {
  const LotteryContract = await ethers.getContractFactory("Lottery")
  const lotteryContract = await LotteryContract.deploy()

  await lotteryContract.deployed()

  console.log("contract deployed to rinkeby test network @ address :", lotteryContract.address)
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.

//contract address: 0x4098FE92a365e72FAAb610B608abB07d7420E415
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
