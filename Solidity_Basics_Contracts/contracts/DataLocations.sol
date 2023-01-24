//SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;
contract DataLocations{
   function returnMany() public pure returns(uint,bool,uint)
   {
       return (1, true, 2);
   }

   function named() public pure returns ( uint x, bool b, uint y)
   {
       return(1, true, 2);
   }

   function assigned() public pure returns (uint x, bool b, uint y)
   {
       x = 1;
       b = true;
       y = 2;
   }
}
