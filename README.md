# Multisig Price Oracle

A production-ready implementation for fetching and utilizing decentralized price feeds. This repository demonstrates how to securely integrate **Chainlink Data Feeds** into your smart contracts to prevent price manipulation and flash loan attacks.

## Core Features
* **Decentralized Feeds**: Uses Chainlink's network of nodes for data aggregation.
* **Price Heartbeat**: Logic to check data freshness before execution.
* **Safety Checks**: Built-in validation to ensure prices are within expected ranges.

## Implementation Details
The contract fetches the latest price of ETH/USD (or any other pair) by calling the `latestRoundData` function on the specific aggregator address for the network.

## License
MIT
