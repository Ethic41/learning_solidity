// SPDX-License-Identifier: MIT
// -=-<[ Bismillahirrahmanirrahim ]>-=-
// -*- coding: utf-8 -*-
// @Date    : 2024-08-05 21:22:03
// @Author  : Dahir Muhammad Dahir (dahirmuhammad3@gmail.com)
pragma solidity ^0.8.26;

import {Script} from "@forge-std/src/Script.sol";
import {SimpleStorage} from "src/basics/SimpleStorage.sol";

contract DeploySimpleStorage is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        new SimpleStorage();

        vm.stopBroadcast();
    }
}

