// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "./PriceConverter.sol";


contract FundMe {

    using PriceConverter for uint256;

    uint256 public minimumUsd = 50 * 1e18; // 1 * 10 ** 18

    // track the funders who sent us money
    // create an array of addresses called funders
    address[] public funders;

    mapping(address => uint256) public addressToAmountFunded;


    function fund() public payable {
        // Want to be able to set a minimum fund amount in USD
        // 1. How do we send ETH to this contract?
        
        require(msg.value.getConversionRate() >= minimumUsd, "Didn't send enough!"); // 1e18 == 1 * 10 * 18 == 1000000000000000000
        // 18 decimals
        funders.push(msg.sender);

        addressToAmountFunded[msg.sender] += msg.value;
        // what is reverting?
        // undo any action before, and send remaining gas back
    }
    

    // funderIndex++ equals funderIndex = funderIndex + 1
    function withdraw() public {
        // for loop
        /* starting index, ending index, step amount */
        for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
            // code
            address funder = funders[funderIndex]; // grab that funder at the 0th index
            addressToAmountFunded[funder] = 0; // reset the address of that funder back to 0

        }

        // reset the funders array to a blank array
        funders = new address[](0);
        // actually withdraw the funds: three different ways to do this:
        
        // // transfer(simplest)

        // // msg.sender = address
        // // payable(msg.sender) = payable address
        // payable(msg.sender).transfer(address(this).balance);


        // // send
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "Send failed");

        // call
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require (callSuccess, "Call failed");
    }
}