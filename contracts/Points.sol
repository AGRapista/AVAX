// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Points is ERC20, Ownable {

    struct shopItem {
        uint cost;
        address itemOwner;
    }
    
    mapping(string => shopItem) shopItems;
    string[] itemList;
    uint[] itemCosts;

    constructor() ERC20("Degen", "DGN") {}

    // Admin Controls ________________________________________________________________

    function mint(address to, uint amount) public onlyOwner {
        _mint(to, amount);
    }

    function mintShopItem(string memory name, uint cost) public onlyOwner{
        shopItems[name] = shopItem(cost, address(0));
        itemList.push(name);
        itemCosts.push(cost);
    }

    // Standard Controls ______________________________________________________________

    function checkBalance() public view returns(uint){
        return balanceOf(msg.sender);
    }

    function transferTokens(address receiver, uint amount) public {
        approve(msg.sender, amount);
        transferFrom(msg.sender, receiver, amount);
    }

    function burnToken(uint amount) public {
        _burn(msg.sender, amount);
    }

    // Shop Controls ___________________________________________________________________

    function redeemShopItem(string memory name) public{
        uint userBalance = checkBalance();
        shopItem memory desiredItem = shopItems[name];

        require(userBalance >= desiredItem.cost, "You have insufficient funds");
        shopItems[name].itemOwner = msg.sender;
        transferTokens(owner(), desiredItem.cost);
    }

    function viewShop() public view returns(string[] memory, uint[] memory){
        return (itemList, itemCosts);
    }

    function viewOwner(string memory itemName) public view returns(address){
        return (shopItems[itemName].itemOwner);
    }

}
