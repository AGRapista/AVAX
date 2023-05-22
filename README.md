# Building on AVAX: ETH + AVAX assessment

This project is created in compliance with the Metacrafters Building on AVAX course final assessment requirements.
The project demonstrates the following elements:

+ Creation and compilation of Smart Contract
+ Deployment of said Smart Contract to the Fuji test network
+ Verification of Smart Contract in Snowtrace
+ Minting, Transfer, Burning of a custom token using the ERC20 standard
+ Basic smart contract state data manipulation 

## Deployment
Please refer to the GUIDE.md in this directory for details on how to deploy this project. Once setup run the following commands:
``` npx hardhat run scripts/deploy.js --network fuji ``` - This would output an address which should be used the proceeding command       
``` npx hardhat verify <Contract Address> --network fuji ``` 

## Remix Deployment
Please ensure first that the contract has already been deployed at the Fuji network and is verified
in Snowtrace and that a proper MetaMask wallet has been setup.

1. Retrieve the address of the deployed contract
2. In the Remix Environment Field, select Injected Provider. This should bridge Remix with your browser's MetamMask wallet
3. Navigate towards the field beside the "At Address" button and place the Contract Address
4. Click the "At Address" button and the contract should load which would allow the calling of the Smart Contract functions

## Functions
The following would be a breakdown of the functions within the Smart Contract 
``` mint() ``` - Makes use of the ERC20 standard function _mint to mint the provided amount of tokens to the provided address. Can only be called by Smart Contract owner.     
``` mintShopItem() ``` - Creates a new shop item and records it to the local smart contract state data. Can only be called by Smart Contract owner.     
``` checkBalance() ``` - Retrieves the balance of the caller.     
``` transferTokens() ``` - Facilitates exchange of provided token amount between the function caller and the specified address.     
``` burnToken() ``` - Makes use of the ERC20 function _burn to destroy an amount of tokens from the caller effectively destroying the tokens and removing them from circulation.     
``` redeemShopItem() ``` - Allows the caller to redeem and be in possession of a shop item. Validates if the caller has sufficient funds to make the purchase.     
``` viewShop() ``` - Lists down available options from the shop.     
``` viewOwner ``` - Retrieves the owner address of the shop item.     

## Author
AGRAPISTA
