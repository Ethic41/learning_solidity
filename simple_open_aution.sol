// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

contract SimpleAuction {

    address payable public beneficiary;
    uint public auctionEndTime;

    address public highestBidder;
    uint public highestBid;

    mapping (address => uint) pendingReturns;

    bool ended;

    event HighestBidIncrease(address bidder, uint amount);
    event AuctionEnded(address winner, uint amount);

    /// Auction has already ended.
    error AuctionAlreadyEnded();

    /// There is already a higher or equal bid
    error BidNotHightEnough(uint highestBid);

    /// The auction has not ended yet.
    error AuctionNotYetEnded();

    /// The function auctionEnd has already been called.
    error AuctionEndAlreadyCalled();

    constructor(uint biddingTime, address payable beneficiaryAddress) {

        beneficiary = beneficiaryAddress;
        auctionEndTime = biddingTime;

    }

    function bid() external payable{
        // this contract can be manipulated by the creator
        // to inflate bidding
        if (block.timestamp > auctionEndTime){
            revert AuctionAlreadyEnded();
        }

        if (msg.value <= highestBid){
            revert BidNotHightEnough(highestBid);
        }

        if (highestBid != 0){
            pendingReturns[highestBidder] += highestBid;
        }

        highestBidder = msg.sender;
        highestBid = msg.value;
        
        emit HighestBidIncrease(msg.sender, msg.value);
    }

    function withdraw() external returns (bool) {
        uint amount = pendingReturns[msg.sender];

        if (amount > 0) {
            pendingReturns[msg.sender] = 0;

            if (!payable(msg.sender).send(amount)){
                pendingReturns[msg.sender] = amount;
                return false;
            }
        }

        return true;
    }

    function auctionEnd() external {
        // Best practice
        // 1. checking conditions
        // 2. performing actions (potentially changing conditions)
        // 3. interacting with other contracts

        // checks
        if (block.timestamp < auctionEndTime) {
            revert AuctionNotYetEnded();
        }

        if (ended) {
            revert AuctionEndAlreadyCalled();
        }

        // actions
        ended = true;
        emit AuctionEnded(highestBidder, highestBid);

        // interactions
        beneficiary.transfer(highestBid);
    }

}