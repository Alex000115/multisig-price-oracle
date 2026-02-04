/**
 * Deployment script for PriceConsumer contract
 */
const { ethers } = require("hardhat");

async function main() {
  // ETH/USD Aggregator address on Sepolia
  const ETH_USD_FEED = "0x694AA1769357215DE4FAC081bf1f309aDC325306";

  const PriceConsumer = await ethers.getContractFactory("PriceConsumer");
  const consumer = await PriceConsumer.deploy(ETH_USD_FEED);

  await consumer.deployed();

  console.log("PriceConsumer deployed to:", consumer.address);
  
  const price = await consumer.getLatestPrice();
  console.log(`Current ETH Price: ${price.toString()}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
