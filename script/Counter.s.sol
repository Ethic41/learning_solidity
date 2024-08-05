// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "@forge-std-1.9.1/src/Script.sol";
import {Counter} from "src/basics/FirstApp.sol";

contract DeployCounter is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        new Counter();

        vm.stopBroadcast();
    }
}
