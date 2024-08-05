// SPDX-License-Identifier: MIT
// -=-<[ Bismillahirrahmanirrahim ]>-=-
// -*- coding: utf-8 -*-
// @Date    : 2024-08-05 22:18:31
// @Author  : Dahir Muhammad Dahir (dahirmuhammad3@gmail.com)
pragma solidity ^0.8.26;

contract Gas {
    // gas is a unit of computation
    // gas spent * gas price = is the amount you need to pay for a transaction
    // i.e gas spent is the unit of computation used, all instructions have
    // a definite amount of gas they require
    // gas price is the amount you are willing to spend, but the more you are willing
    // the more the network prioritize your txn
    // Upper bounds to gas are two:
    // gas limit: the max amount you are willing to use for your txn
    // block gas limit: max amount of gas allowed in a block, set by the network
    uint256 public i = 0;

    // Gas spent are not refunded
    function forever() public {
        while (true) {
            i += 1;
        }
    }
}

