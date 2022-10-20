// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract StoreLuckyNumber {
    uint256 luckyNumber;

    function storeYourLuckyNumber(uint256 _luckyNumber) public {
        luckyNumber = _luckyNumber;
    }

    function getYourLuckyNumber() public view returns (uint) {
        return luckyNumber;
    }
}
