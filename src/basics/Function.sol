// SPDX-License-Identifier: MIT
// -=-<[ Bismillahirrahmanirrahim ]>-=-
// -*- coding: utf-8 -*-
// @Date    : 2024-08-07 13:40:52
// @Author  : Dahir Muhammad Dahir (dahirmuhammad3@gmail.com)
pragma solidity ^0.8.26;

contract Function {
    // Function can return multiple values
    function returnMany() public pure returns (uint256, bool, uint256) {
        return (1, true, 2);
    }

    // Return values can be named
    function named() public pure returns (uint256 x, bool b, uint256 y) {
        x = 1;
        b = true;
        y = 2;
    }

    // use destructuring assignment when calling another
    // function that returns multiple values
    function destructuringAssignment() public pure returns (uint256, bool, uint256, uint256, uint256) {
        (uint256 i, bool b, uint j) = returnMany();

        // values can be left out
        (uint256 x, , uint256 y) = (4, 5, 6);

        return (i, b, j, x, y);
    }

    // cannot use map for either input or output

    // but can use array for input
    function arrayInput(uint256[] memory _arr) public {}

    // can use array for input
    uint256[] public arr;

    function arrayOutput() public view returns (uint256[] memory){
        return arr;
    }
}

contract KeyVal {
    function someFuncWithManyInputs(uint256 x, uint256 y, uint256 z, address a, bool b, string memory c) public pure returns (uint256) {}

    function callFunc() external pure returns (uint256) {
        return someFuncWithManyInputs(1, 2, 3, address(0), true, "c");
    }

    function callFuncWithKeyValue() external pure returns (uint256) {
        return someFuncWithManyInputs({a: address(0), b: true, c: "c", x: 1, y: 2, z: 3});
    }
}
