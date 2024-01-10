// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract EtherStore {
    bool reEntrancyMutex = false;
    uint public withdrawalLimit  = 1 ether;

    mapping(address => uint) public lastWithdrawTime;
    mapping(address => uint) public balances;

    function depositFunds() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdrawFunds (uint weiToWithdraw) public {
        require(!reEntrancyMutex);
        require(balances[msg.sender] >= weiToWithdraw);

        require(weiToWithdraw < withdrawalLimit);
        require(block.timestamp >= lastWithdrawTime[msg.sender] + 1 weeks);
        balances[msg.sender] -= weiToWithdraw;

        lastWithdrawTime[msg.sender] = block.timestamp;
        reEntrancyMutex = true;

        payable(msg.sender).transfer(weiToWithdraw);
        reEntrancyMutex = false;
    }
}