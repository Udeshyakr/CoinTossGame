// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CoinToss is Ownable {
    using SafeMath for uint256;
    /*
     * We will be using this below to help generate a random number
     */
    uint256 public seed;

    constructor() {
        /*
         * Set the initial seed
         */
        seed = (block.timestamp + block.difficulty) % 1000;
    }

    receive() external payable {}

    function gambling() public payable {
        require(msg.sender != address(0), "owner cannot send money");
        uint256 amount = msg.value;
        if (amount > address(this).balance) {
            payable(msg.sender).transfer(msg.value);
        } else {
            winProbability(amount);
        }
    }

    function winProbability(uint256 _amount) internal {
        seed = (block.difficulty + block.timestamp + seed) % 1000;
        if (seed < 499) {
            payable(msg.sender).transfer(2 * _amount);
        }
    }

    function withdraw(uint256 _amount) external onlyOwner {
        payable(owner()).transfer(_amount);
    }
}
