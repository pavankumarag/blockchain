// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleVoting {
    bool public isVoting;
    address public  owner;
    struct vote {
        address receiver;
        uint256 timestamp;
    }
    mapping (address => vote) public votes;
    event AddVote(address voter, address receiver, uint256 timestamp);
    event RemoveVote(address receiver);
    event StartVoting(address StartedBy);
    event StopVoting(address StoppedBy);
     event AddressRegistered(address addy);

    address[] public VoterAddresses;
    mapping(address => bool) public voterAllowed;

    constructor() {
        owner = msg.sender;
        isVoting = false;
    }

    function beginVoting() external returns(bool) {
        require(msg.sender  == owner, "only owner is allowed to begin voting");
        isVoting = true;
        emit StartVoting(msg.sender);
        return true;
    }

     function stopVoting() external returns(bool) {
        require(msg.sender  == owner, "only owner is allowed to begin voting");
        isVoting = false;
        emit StopVoting(msg.sender);
        return false;
    }

    function registerAddress(address voter) external returns(bool){
        require(msg.sender == owner, "Only owner is allowed to register voters");
        VoterAddresses.push(voter);
        emit AddressRegistered(voter);
        return true;
    }

    function addVote(address receiver) external returns(bool) {
        require(isVoting == true, "Owner should beging voting before anyone starts voting");
        require(voterAllowed[receiver] == true, "Voter should register before voting");
        votes[msg.sender].receiver = receiver;
        votes[msg.sender].timestamp = block.timestamp;
        emit AddVote(msg.sender, votes[msg.sender].receiver, votes[msg.sender].timestamp);
        return true;
    }
    
}
