// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

/// @title Growic task answers
/// @author pxng0lin
/// @notice Examples of mapping used to answer questions from task 2 in the Growic 2022 course

contract GrowicBank {

    address public owner;
    mapping(address => uint256) private balance;
    
    struct Customer_kyc {
        string name;
        uint256 age;
    }

    // Customer_kyc public kyc;
    Customer_kyc[] public kycEntries; // auto getter will allow input for indexing
    // mapping(address => Customer_kyc[]) public kycByCustomer;
    constructor() payable {
        owner = msg.sender;
    }

    // created an internal function so that the balance can be updated rather than overidden
    function updateBalance(address _addr, uint256 _toAdd) internal {
        require(_toAdd > 0, "Please provide an amount more than 0"); // check that the deposit amount is more than 0, otherwise revert and show msg
        balance[_addr] += _toAdd;
    }

    function deposit(address _customer, uint256 _deposit) external {
        /** 
         * Added an if statement so we can add to the balance, rather than just override the current one
         * source: https://www.tutorialspoint.com/solidity/solidity_if_else_statement.htm
        */

        if(balance[_customer] > 0) {
            updateBalance(_customer, _deposit);
        } else {
            balance[_customer] = _deposit;
        }
        
    }

    function checkBalance() public view returns(uint256) {
        address _addr = msg.sender;
        return balance[_addr];
    }


    function setUserDetails(string memory _name, uint256 _age) public {
        // kycEntries.push(Customer_kyc(_name, _age)); 
        /**
         * the issue here was memory, you have to use storage for perm save of the user details
         * this way it can be retrieve by the get function later
        */

        Customer_kyc storage _kyc = kycByCustomer[msg.sender]; // storage not memory
        
        _kyc.name = _name;
        _kyc.age = _age;
    }

    function getUserDetail() public view returns(Customer_kyc memory) {
        return kycByCustomer[msg.sender]; // now the user details are saved, they can be retrieved
        
    }
        
    // to support receiving ETH by default
    receive() external payable {}

    fallback() external payable {}
}
