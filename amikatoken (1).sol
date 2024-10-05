// SPDX-License-Identifier: MIT

//For this project, you will write a smart contract to create your own ERC20 token 
//and deploy it using HardHat or Remix. Once deployed, you should be able to interact 
//with it for your walk-through video. From your chosen tool, the contract owner should 
//be able to mint tokens to a provided address and any user should be able to burn
// and transfer tokens.

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20 {
 constructor() ERC20("Shreya Kandpal","SHK") {
     _mint(msg.sender, 1000 * 10**18);  // Mint 1000 tokens to the contract deployer
 }

 // Function to mint new tokens, callable only by the owner
     function mint(address to, uint256 amount) public  {
     _mint(to, amount);
 }

 // Override transfer function to include a balance check
 function transfer(address recipient, uint256 amount) public override returns (bool) {
     require(balanceOf(msg.sender) >= amount, "Insufficient funds to transfer");
     _transfer(msg.sender, recipient, amount);
     return true;
 }

 function sendFunds(address , uint _amount) public payable{
     require(balanceOf(msg.sender)> _amount, "unsufficient funds to transfer");
 }

 function burn(uint256 amount) public {
     _burn(msg.sender, amount);
 }
}
  


