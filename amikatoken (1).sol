// SPDX-License-Identifier: MIT

//For this project, you will write a smart contract to create your own ERC20 token 
//and deploy it using HardHat or Remix. Once deployed, you should be able to interact 
//with it for your walk-through video. From your chosen tool, the contract owner should 
//be able to mint tokens to a provided address and any user should be able to burn
// and transfer tokens.

pragma solidity ^0.8.0;

import "@openzeppelin/contracts@4.5.0/access/Ownable.sol";
import "@openzeppelin/contracts@4.5.0/token/ERC20/ERC20.sol";

contract ShoppingToken is ERC20, Ownable {
    // Constructor to initialize the token with a name, symbol, and initial supply
    constructor() ERC20("ShoppingToken", "SHO") {
        _mint(msg.sender, 1000 * 10**18);  // Mint 1000 tokens to the contract deployer
    }
    // Function to mint new tokens, callable only by the owner
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Function to burn tokens from the caller's address
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }
}
