//A contract for donut vending machine
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract VendingMachine{
    address public owner;
    mapping(address => uint) public donutBalances;
    constructor() {
        owner = msg.sender;
        donutBalances[address(this)] = 1000;
    }

    function getBalance() public view returns (uint) {
        return donutBalances[address(this)];
    }

    function restock(uint amount) public {
        require(msg.sender == owner, "Only the owner can restock the donut");
        donutBalances[address(this)] += amount;
    }

    function buyDonut(uint amount) public payable{
        require(msg.value >= amount * 2 ether, "You must pay atleast 2 ether per donut");
        require(donutBalances[address(this)] >= amount, "OOPS! Not enough donuts");
        donutBalances[address(this)] -= amount;
        donutBalances[address(msg.sender)] += amount;
    }
}

