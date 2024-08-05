// SPDX-License-Identifier: MIT
// -=-<[ Bismillahirrahmanirrahim ]>-=-
// -*- coding: utf-8 -*-
// @Date    : 2024-08-05 21:10:27
// @Author  : Dahir Muhammad Dahir (dahirmuhammad3@gmail.com)
pragma solidity ^0.8.26;

contract Immutable {
    // coding convention to uppercase constant variables
    address public immutable MY_ADDRESS;
    uint256 public immutable MY_UINT;

    constructor(uint256 _myUint){
        MY_ADDRESS = msg.sender;
        MY_UINT = _myUint;
    }
}

