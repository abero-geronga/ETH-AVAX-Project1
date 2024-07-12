// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract project1 {

    uint256 public balance;

    // Function to deposit an amount to the balance
    // Uses require() to ensure a positive deposit amount
    function deposit(uint256 amount) public {
        require(amount > 0, "Deposit amount must be greater than zero.");
        balance += amount;
    }

    // Function to withdraw an amount from the balance
    // Uses require() to ensure there are enough funds
    function withdraw(uint256 amount) public {
        require(amount <= balance, "Insufficient balance.");
        balance -= amount;
    }

    // Function to double the balance
    // Uses assert() to ensure the balance does not overflow
    function doubleBalance() public {
        uint256 newBalance = balance * 2;
        assert(newBalance >= balance); // This checks for overflow
        balance = newBalance;
    }

    // Function to reset the balance
    // Uses revert() to handle unauthorized access
    function resetBalance() public {
        if (msg.sender != address(0x123)) {
            revert("Unauthorized access.");
        }
        balance = 0;
    }

    // Function to get the current balance
    function getBalance() public view returns (uint256) {
        return balance;
    }
}
