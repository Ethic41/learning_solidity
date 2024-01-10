// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

contract Coin {
    // public keyword makes variables accessible
    // from other contracts
    address public minter;
    mapping (address => uint) public balances;

    // Events allow clients to react to specific
    // contract changes you declare
    event Sent(address from, address to, uint amount);

    // Constructor code is only run when the contract
    // is created
    constructor() {
        // set the minter to be the contract creator
        // this is only executed once
        minter = msg.sender;
    }

    // sends an amount of newly minted coins to an address
    function mint(address receiver, uint amount) public {
        // only the contract creator can mint
        require(msg.sender == minter);
        balances[receiver] += amount;
    }

    // errors allow you to provide information about
    // why an operation failed. they are returned
    // to the caller of the function
    error InsufficientBalance(uint requested, uint available);

    function send(address receiver, uint amount) public {
        if (amount > balances[msg.sender]){
            revert InsufficientBalance({
                requested: amount,
                available: balances[msg.sender]
            });
        }

        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }

}