// SPDX-License-Identifier: MIT
// -=-<[ Bismillahirrahmanirrahim ]>-=-
// -*- coding: utf-8 -*-
// @Date    : 2024-08-02 20:22:05
// @Author  : Dahir Muhammad Dahir (dahirmuhammad3@gmail.com)
pragma solidity ^0.8.26;

contract Variables {
    // State variables are stored on the blockchain
    string public text = "Hello";
    uint public num = 123;

    function doSomething() public view {
        // Local variables are not saved on the blockchain
        uint i = 456;

        // Here are some global variables
        uint timestamp = block.timestamp; // current block timestamp
        address sender = msg.sender; // address of the caller
    }
}

