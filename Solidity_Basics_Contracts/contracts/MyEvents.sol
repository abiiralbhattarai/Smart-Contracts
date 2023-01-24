//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract MyEvents {
    event CreatedNFT(address indexed user, uint256 id, uint256 dna);

    function createNFT(uint256 _id, uint256 _dna, uint) public {
        emit CreatedNFT(msg.sender, _id, _dna);

    }
}