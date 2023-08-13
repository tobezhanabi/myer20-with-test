import { getContractFactory } from "@nomicfoundation/hardhat-ethers/types";
import { ethers } from "hardhat";

async function main() {
  const accounts = await ethers.getSigners();

  const tokenContractFactory = await ethers.getContractFactory("MyERC20Token");
  const tokenContract = await tokenContractFactory.deploy();
  await tokenContract.waitForDeployment();

  //fetch role
  const code = await tokenContract.MINTER_ROLE();
  console.log(`tHe code is ${code}`);
  // MINT tokenContract
  const mintTx = await tokenContract
    .connect(accounts[2])
    .mint(accounts[0].address, 2);
  await mintTx.wait();
  //fetch balance
  const myBalance = await tokenContract.balanceOf(accounts[0].address);
  console.log(`My balance is ${myBalance.toString()} decimals units`);
  const otherBalance = await tokenContract.balanceOf(accounts[1].address);
  console.log(
    `The balance of acc1 is ${otherBalance.toString()} decimals units`
  );
}
main().catch((err) => {
  console.error(err);
  process.exitCode = 1;
});
