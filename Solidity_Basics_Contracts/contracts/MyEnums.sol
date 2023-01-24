//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract MyEnums {

    enum Rarity {
        original,
        rare,
        super_rare
    }

    Rarity public rarity;

    constructor() {
        rarity=Rarity.original;
    }

    function makeSuperRare() public {
        rarity = Rarity.super_rare;
    }
}