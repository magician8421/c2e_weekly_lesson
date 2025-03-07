// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
import "hardhat/console.sol";

contract GasEstimate{
    function estimateGasCost(uint256 data) public view returns (uint256) {
        uint256 gasStart = gasleft();
        // Execute the operation that consumes gas
        // ...
        uint256 gasSpent = gasStart - gasleft();
        return gasSpent * tx.gasprice;
    }
}

 