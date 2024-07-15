# Error Handling Example

This Solidity program demonstrates the use of `require()`, `assert()`, and `revert()` statements for error handling in smart contracts. The purpose of this program is to provide a basic understanding of these statements and their usage in different scenarios.

## Description

The TicketReservation contract is a simple smart contract written in Solidity that allows users to reserve and cancel tickets. This contract demonstrates the use of require(), assert(), and revert() statements for condition checking and error handling.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a `.sol` extension (e.g., `project1.sol`). Copy and paste the following code into the file:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TicketReservation {
    // Maximum number of tickets available
    uint256 public maxTickets;
    // Number of tickets reserved
    uint256 public reservedTickets;

    // Mapping to track the number of tickets reserved by each address
    mapping(address => uint256) public reservations;

    // Event to log ticket reservations
    event TicketReserved(address indexed user, uint256 amount);
    // Event to log ticket cancellations
    event ReservationCancelled(address indexed user, uint256 amount);

    // Constructor to set the maximum number of tickets
    constructor(uint256 _maxTickets) {
        maxTickets = _maxTickets;
    }

    // Function to reserve tickets
    function reserveTickets(uint256 amount) public {
        // Ensure the amount of tickets to reserve is greater than zero
        require(amount > 0, "Must reserve at least one ticket");
        // Ensure there are enough tickets available
        require(reservedTickets + amount <= maxTickets, "Not enough tickets available");

        // Update the number of reserved tickets
        reservedTickets += amount;
        // Update the user's reservations
        reservations[msg.sender] += amount;

        // Ensure the user's reservations are correctly updated
        assert(reservations[msg.sender] >= amount);

        // Emit the TicketReserved event
        emit TicketReserved(msg.sender, amount);
    }

    // Function to cancel reserved tickets
    function cancelReservation(uint256 amount) public {
        // Ensure the user has enough tickets to cancel
        require(reservations[msg.sender] >= amount, "Not enough reserved tickets to cancel");

        // Update the number of reserved tickets
        reservedTickets -= amount;
        // Update the user's reservations
        reservations[msg.sender] -= amount;

        // Ensure the user's reservations are correctly updated
        assert(reservations[msg.sender] >= 0);

        // Emit the ReservationCancelled event
        emit ReservationCancelled(msg.sender, amount);
    }

    // Function to get the number of reserved tickets for a user
    function getReservedTickets() public view returns (uint256) {
        return reservations[msg.sender];
    }

    // Function to check if a user can reserve more tickets
    function canReserveMore(uint256 amount) public view returns (bool) {
        // Check if the user can reserve the specified amount of tickets
        if (reservedTickets + amount > maxTickets) {
            revert("Not enough tickets available");
        }
        return true;
    }
}

```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to a compatible version (e.g., 0.8.0 or later), and then click on the "Compile project1.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the project1 contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling the contract's functions. Here are the steps for some example interactions:

## Functions

### Constructor
`constructor(uint256 _maxTickets)`: Sets the maximum number of tickets available upon deployment.

### reserveTickets
function `reserveTickets(uint256 amount) public`: Allows users to reserve a specified number of tickets.
Uses `require()` to ensure the reservation amount is valid and tickets are available.
Updates the reserved tickets and the user's reservations.
Uses `assert()` to ensure the user's reservations are correctly updated.
Emits the `TicketReserved` event.

### cancelReservation
function `cancelReservation(uint256 amount) public`: Allows users to cancel a specified number of reserved tickets.
Uses `require()` to ensure the user has enough tickets to cancel.
Updates the reserved tickets and the user's reservations.
Uses `assert()` to ensure the user's reservations are correctly updated.
Emits the `ReservationCancelled` event.

###getReservedTickets
function `getReservedTickets() public view returns (uint256)`: Allows users to check the number of tickets they have reserved.

### canReserveMore
function `canReserveMore(uint256 amount) public view returns (bool)`: Checks if a user can reserve more tickets.
Uses `revert()` if there are not enough tickets available.

## Authors
Abero Isaiah D. Geronga

## License
This project is licensed under the MIT License - see the LICENSE.md file for details.
