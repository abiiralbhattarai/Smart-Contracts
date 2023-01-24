//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract MyErrorsAndChecks {
    function myPureFunc(uint256 _x, uint256 _y) public pure returns (uint256 xy){
       require(_x < _y,"X is bigger than Y");
       return _x + _y;
 
    }
}