// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract PracInterface {
    uint public count;

    function increment() external {
        count += 1;
    }
}

interface ICounter {
    function count() external view returns (uint);

    function increment() external;

}

contract MyContract {
    function getCount(address _counter) external view returns (uint){
        return ICounter(_counter).count();
    }
    function incrementCounter(address _counter) external {
        ICounter(_counter).increment();
    }
    
}

