// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;

contract Faucet {

    function withdraw(uint withdraw_amount) public {
        require(withdraw_amount < 1_000_000_000_000_000);

        payable(msg.sender).transfer(withdraw_amount);
    }

    receive() external payable {}
    
}
