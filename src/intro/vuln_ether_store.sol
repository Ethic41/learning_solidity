// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract EtherStore {
    
    uint public withdrawal_limit = 1 ether;
    mapping(address => uint) public last_withdraw_time;
    mapping(address => uint) public balances;
    
    function deposit_funds() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw_funds(uint wei_to_withdraw) public {
        require(balances[msg.sender] >= wei_to_withdraw);
        require(wei_to_withdraw <= withdrawal_limit);

        require(block.timestamp >= last_withdraw_time[msg.sender] + 1 weeks);
        (bool success, ) = msg.sender.call{value: wei_to_withdraw}("");
        require(success);
        balances[msg.sender] -= wei_to_withdraw;
        last_withdraw_time[msg.sender] = block.timestamp;

    }

}