// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8; // This is to make comments

// EVM, Ethereum Virtual Machine
// Avalanche, Fantom, Polygon

contract SimpleStorage {
    // below are the variable types:
    // boolean, unit, int, address, bytes
    // bool hasFavouriteNumber = true;
    // uint256 favouriteNumber = 5; uint8 is the lowest 8 bits is a byte
    // uint = uint256 by default;
    // int favouriteNumber = 123;
    // string favouriteNumberInText = "Five";
    // int256 favoriteInt = -5;
    // address myAddress = asdfqwer124;
    // bytes32 favoriteBytes = "cat";
    uint256 favouriteNumber; // This gets initialized to 0!
    
    mapping(string =>uint256) public nameToFavoriteNumber;

    // uint256 public favouriteNumber;
    // People public person = People({favouriteNumber:2, name: "Patrick"});

    struct People {
        uint256 favouriteNumber;
        string name;
    }

    // uint256[] public favouriteNumberList;
    People[] public people; // [3] -> fixed size array; [] -> dynamic array

    function store(uint256 _favoriteNumber) public virtual {
        favouriteNumber = _favoriteNumber;
    }

    // view, pure
    function retrieve() public view returns(uint256){
        return favouriteNumber;
    }

    // calldata, memory, storage
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        // People memory newPerson = People({ _favoriteNumber,  _name});
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

// 0xd9145CCE52D386f254917e481eB44e9943F39138
}