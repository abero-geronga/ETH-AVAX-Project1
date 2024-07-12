# Error Handling Example

This Solidity program demonstrates the use of `require()`, `assert()`, and `revert()` statements for error handling in smart contracts. The purpose of this program is to provide a basic understanding of these statements and their usage in different scenarios.

## Description

This program is a simple contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain. The contract allows users to deposit and withdraw funds, double the balance, and reset the balance under specific conditions. It utilizes `require()` to validate inputs, `assert()` to check for conditions that should never occur, and `revert()` to handle unauthorized access.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a `.sol` extension (e.g., `ErrorHandlingExample.sol`). Copy and paste the following code into the file:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ErrorHandlingExample {

    uint256 public balance;
    address public owner;

    // Constructor to set the owner of the contract
    constructor() {
        owner = msg.sender;
    }

    // Function to deposit an amount to the balance
    function deposit(uint256 amount) public {
        require(amount > 0, "Deposit amount must be greater than zero.");
        balance += amount;
    }

    // Function to withdraw an amount from the balance
    function withdraw(uint256 amount) public {
        require(amount <= balance, "Insufficient balance.");
        balance -= amount;
    }

    // Function to double the balance
    function doubleBalance() public {
        uint256 newBalance = balance * 2;
        assert(newBalance >= balance); // This checks for overflow
        balance = newBalance;
    }

    // Function to reset the balance
    // Uses revert() to handle unauthorized access
    function resetBalance() public {
        if (msg.sender != owner) {
            revert("Unauthorized access.");
        }
        balance = 0;
    }

    // Function to get the current balance
    function getBalance() public view returns (uint256) {
        return balance;
    }
}
```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to a compatible version (e.g., 0.8.0 or later), and then click on the "Compile ErrorHandlingExample.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the ErrorHandlingExample contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling the contract's functions. Here are the steps for some example interactions:

Deposit Function: Enter a value in the deposit input field and click deposit.
Withdraw Function: Enter a value in the withdraw input field and click withdraw.
Double Balance Function: Click the doubleBalance button.
Reset Balance Function: Click the resetBalance button.
Get Balance Function: Click the getBalance button to view the current balance.

## Authors
Abero Isaiah D. Geronga

## License
This project is licensed under the MIT License - see the LICENSE.md file for details.
