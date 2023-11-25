// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract Voting {
    bool public isVoting;
    struct vote {
        address reciever;
        uint256 timestamp;
    }
    mapping (address => vote) public votes;
    event AddVote(address voter, address reciever, uint256 timestamp);
    event RemoveVote(address voter);
    event StartVoting(address startedBy);
    event StopVoting(address stoppedBy);
    constructor() {
        isVoting = false;
    }
    function beginVote() external returns(bool) {
        isVoting = true;
        emit StartVoting(msg.sender);
        return true;
    }
    function stopVote() external returns(bool) {
        isVoting = false;
        emit StopVoting(msg.sender);
        return true;
    }
    function addVote(address reciever) external returns(bool){
        votes[msg.sender].reciever = reciever;
        votes[msg.sender].timestamp = block.timestamp;
        emit AddVote(msg.sender, votes[msg.sender].reciever, votes[msg.sender].timestamp);
        return true;
    }
    function removeVote() external returns(bool){
        delete votes[msg.sender];
        emit RemoveVote(msg.sender);
        return true;
    }
    function getVote(address voterAddress) external view returns (address candidateAddress){
        return votes[voterAddress].reciever;
    }
}
