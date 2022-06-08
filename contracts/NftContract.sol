//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NftContract is ERC721Enumerable, Ownable {
    using Strings for uint256;

    string public baseURI;
    string public baseExtension = ".json";
    uint256 public pricePerNft = 2 ether;
    bool public paused = false; //to pause the contract when needed
    uint256 public maxSupply = 100;
    bool public onlyWhitelisted = true;
    address [] public whiteListedAddresses;

    mapping(address => uint8) public _allowedAddresses;


    constructor(string memory _name, string memory _symbol)
        // string memory _initBaseURI
        ERC721(_name, _symbol)
    {
        // setBaseURI(_initBaseURI);
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return baseURI;
    }

    // mint function
    function mint(uint8 _mintAmount) public payable {
        require(!paused, "The contract is paused at the moment");
        uint256 tsupply = totalSupply();
        require(
            _mintAmount <= _allowedAddresses[msg.sender],
            "Exceeded max available to purchase"
        );
        require(_mintAmount > 0, "You need to mint at least One NFT");
        require(tsupply + _mintAmount <= maxSupply, "NFT supply exceeded");
        require(
            pricePerNft * _mintAmount <= msg.value,
            "Ether value sent is not correct"
        );
        _allowedAddresses[msg.sender] -=  _mintAmount;
         for (uint256 i = 1; i <= _mintAmount; i++) {
      _safeMint(msg.sender, tsupply + i);
    }

    }

    //setting  whitelist addresses and number of token they can mint
    function setwhiteListedAddresses (
        address[] calldata addresses,
        uint8 numAllowedToMint
    ) public onlyOwner {
        for (uint256 i = 0; i < addresses.length; i++) {
            whiteListedAddresses.push(addresses[i]);
            _allowedAddresses[addresses[i]] = numAllowedToMint;
        }
    }
    //available to mint
     function numAvailableToMint(address addr) external view returns (uint8) {
        return _allowedAddresses[addr];
    }

     //getWhiteListed Address
    function getWhiteListedAddress() public view returns (address[] memory, uint[] memory) {
        address[] memory addressAllowed = new address[](whiteListedAddresses.length);
        uint [] memory mintAllowed = new uint [] (whiteListedAddresses.length);
        for (uint i = 0; i < whiteListedAddresses.length; i++) {
            addressAllowed[i] = whiteListedAddresses[i];
            mintAllowed[i] = _allowedAddresses[whiteListedAddresses[i]];
        }
        return (addressAllowed, mintAllowed);

    }

    //function to set new Cost
    function setPricePerNft(uint256 _newCost) public onlyOwner {
        pricePerNft = _newCost;
    }


    //function to pause contract
    function pause(bool _state) public onlyOwner {
        paused = _state;
    }
   

    //function withdraw
      function withdraw() public payable onlyOwner {
         (bool os, ) = payable(owner()).call{value: address(this).balance}("");
          require(os);
      }
        
}
