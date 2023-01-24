// A basic wallet

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract BasicWallet {
    address payable public owner;

    uint amountNeeded = 0.02 ether;

    constructor() {
        owner = payable(msg.sender);
    }

    function payMoney( ) public payable {
      
    }

    function withdraw(uint _amount) external {
        require(msg.sender == owner, "caller is not owner");
        payable(msg.sender).transfer(_amount);
    }

    function getBalance() external view returns (uint) {
         return address(this).balance;
    }
}
