// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

/// @title Growic task answers
/// @author pxng0lin
/// @notice Examples of mapping used to answer questions from task 2 in the Growic 2022 course

contract GrowicBank {

    address public owner;
    mapping(address => uint256) private balance;


    constructor() payable {
        owner = msg.sender;
    }

    function deposit(address _customer, uint256 _deposit) external {
        balance[_customer] = _deposit;
    }

    function checkBalance() public view returns(uint256) {
        address _addr = msg.sender;
        return balance[_addr];
    }

    // to support receiving ETH by default
    receive() external payable {}

    fallback() external payable {}
}
