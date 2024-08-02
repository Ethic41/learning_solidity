// SPDX-License-Identifier: MIT
// -=-<[ Bismillahirrahmanirrahim ]>-=-
// -*- coding: utf-8 -*-
// @Date    : 2024-08-02 19:38:56
// @Author  : Dahir Muhammad Dahir (dahirmuhammad3@gmail.com)
pragma solidity ^0.8.26;

contract Primitive {
    // boolean
    bool public boo = true;

    // unsigned int
    uint8 public u8 = 1;
    uint256 public u256 = 456;
    uint public u = 123;

    // signed int
    int8 public i8 = -1;
    int256 public i256 = 456;
    int public i = -123;

    // min and max of int
    int256 public minInt = type(int256).min;
    int256 public maxInt = type(int256).max;

    address public addr = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;

    bytes1 a = 0xb5;
    bytes1 b = 0x56;

    bool public defaultBoo; // false
    uint256 public defaultUint; // 0
    int256 public defaultInt; // 0
    address public defaultAddr; // 0x000

}

