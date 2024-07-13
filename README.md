# ETH-AVAX PROJECT 1

As per the instructions from Metacrafters: "For this project, you will write a smart contract to create your own ERC20 token and deploy it using HardHat or Remix. Once deployed, you should be able to interact with it for your walk-through video. From your chosen tool, the contract owner should be able to mint tokens to a provided address and any user should be able to burn and transfer tokens."

## Description

This Solidity program creates an ERC20 token named "Fauna" with the symbol "FNA". The contract allows the owner to mint new tokens and any user to burn and transfer tokens. The purpose of this program is to demonstrate the creation, deployment, and interaction with a custom ERC20 token on the Ethereum blockchain.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a `.sol` extension (e.g., `Fauna.sol`). Copy and paste the following code into the file:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;


import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Fauna is ERC20 {
    address public owner;

    // Constructor that initializes the token with a name, symbol, and initial supply
    constructor(uint256 initialSupply) ERC20("Fauna", "FNA") {
        _mint(msg.sender, initialSupply);// Mint the initial supply to the deployer
        owner = msg.sender;
    }

     // Modifier to restrict certain functions to the owner only
    modifier onlyOwner() {
        require(msg.sender == owner, "Error: Not the Owner");
        _;
    }

    // Function that allows the owner to mint new tokens
    function mint(address to, uint256 value) external onlyOwner {
        _mint(to, value);
    }

    function burn(address from, uint256 value) external {
        _burn(from, value);
    }

}

```

To compile the code, click on the `Solidity Compiler` tab in the left-hand sidebar. Make sure the `Compiler` option is set to a compatible version (e.g., 0.8.0 or later), and then click on the `Fauna.sol` button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the created contract from the dropdown menu, and then click on the `Deploy` button.

Deploy the Contract:

Go to the "Deploy & Run Transactions" tab.
Enter the initial supply (e.g., 1000).
Click "Deploy".

## Interact with the Contract:

After deployment, the contract instance will appear under "Deployed Contracts".

### Mint Tokens:
Select the `mint` function.
Provide the recipient address and the amount of tokens to mint.
Example: `mint("0xRecipientAddress", 100)`.

### Burn Tokens:
Select the `burn` function.
Provide the amount of tokens to burn.
Example: `burn(50)`.

### Transfer Tokens:
Use the inherited transfer function to transfer tokens to another address.
Example: `transfer("0xRecipientAddress", 25)`.


## Authors
Abero Isaiah D. Geronga

## License
This project currently has no license.
