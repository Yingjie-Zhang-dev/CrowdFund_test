// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// inheritent
import "./SimpleStorage.sol";

contract ExtraStorage is SimpleStorage {
    // +5
    // override
    // virtual override
    function store(uint256 _favoriteNumber) public override {
        favouriteNumber = _favoriteNumber +5;

    }
}