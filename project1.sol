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
