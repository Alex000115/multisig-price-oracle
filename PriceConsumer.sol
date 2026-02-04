// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

/**
 * @title PriceConsumer
 * @dev Securely retrieves real-time asset prices from Chainlink Oracles.
 */
contract PriceConsumer {
    AggregatorV3Interface internal priceFeed;

    /**
     * Network: Sepolia
     * Aggregator: ETH/USD
     * Address: 0x694AA1769357215DE4FAC081bf1f309aDC325306
     */
    constructor(address _priceFeed) {
        priceFeed = AggregatorV3Interface(_priceFeed);
    }

    /**
     * @notice Returns the latest price with safety checks for stale data.
     * @return price The current asset price scaled by 10^8.
     */
    function getLatestPrice() public view returns (int) {
        (
            uint80 roundID,
            int price,
            uint startedAt,
            uint timeStamp,
            uint80 answeredInRound
        ) = priceFeed.latestRoundData();
        
        // Ensure the price is positive and the data is not stale
        require(price > 0, "Invalid price data");
        require(timeStamp > 0, "Round not complete");
        require(answeredInRound >= roundID, "Stale price data");

        return price;
    }

    /**
     * @dev Converts the oracle price to a human-readable format.
     */
    function getDecimals() public view returns (uint8) {
        return priceFeed.decimals();
    }
}
