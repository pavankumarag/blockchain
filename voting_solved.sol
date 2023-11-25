// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ClassRepresentativeElection {
    address public teacher;  // The address of the class teacher
    bool public votingStarted;
    bool public votingEnded;
    address public winner;
    
    struct Candidate {
        string name;
        bool registered;
        uint voteCount;
    }
    
    mapping(address => Candidate) public candidates;
    address[] public candidateList;

    mapping(address => bool) public hasVoted;
    mapping(address => bool) public isRegisteredVoter;

    event VotingStarted();
    event VotingEnded();
    event Voted(address indexed voter, address indexed candidate);
    event WinnerDeclared(address indexed winner);

    constructor() {
        teacher = msg.sender;  // Deploying account is the class teacher
        votingStarted = false;
        votingEnded = false;
    }

    modifier onlyTeacher() {
        require(msg.sender == teacher, "Only the class teacher can call this function.");
        _;
    }

    modifier canVote() {
        require(votingStarted, "Voting has not started yet.");
        require(!votingEnded, "Voting has ended.");
        require(isRegisteredVoter[msg.sender], "You are not a registered voter.");
        require(!hasVoted[msg.sender], "You have already voted.");
        _;
    }

    modifier validCandidate(address candidateAddress) {
        require(candidates[candidateAddress].registered, "The candidate is not registered.");
        _;
    }

    function startVoting() public onlyTeacher {
        require(!votingStarted, "Voting has already started.");
        votingStarted = true;
        emit VotingStarted();
    }

    function endVoting() public onlyTeacher {
        require(votingStarted, "Voting has not started yet.");
        require(!votingEnded, "Voting has already ended.");
        votingEnded = true;
        address winningCandidate = candidateList[0];
        uint winningVoteCount = candidates[winningCandidate].voteCount;

        for (uint i = 1; i < candidateList.length; i++) {
            address currentCandidate = candidateList[i];
            if (candidates[currentCandidate].voteCount > winningVoteCount) {
                winningCandidate = currentCandidate;
                winningVoteCount = candidates[currentCandidate].voteCount;
            }
        }
        winner = winningCandidate;
        emit VotingEnded();
        emit WinnerDeclared(winner);
    }

    function registerCandidate(address candidateAddress, string memory candidateName) public onlyTeacher {
        candidates[candidateAddress] = Candidate(candidateName, true, 0);
        candidateList.push(candidateAddress);
    }

    function registerVoter(address voterAddress) public onlyTeacher {
        isRegisteredVoter[voterAddress] = true;
    }

    function vote(address candidateAddress) public canVote validCandidate(candidateAddress) {
        candidates[candidateAddress].voteCount++;
        hasVoted[msg.sender] = true;
        emit Voted(msg.sender, candidateAddress);
    }

    function getNumCandidates() public view returns (uint) {
        return candidateList.length;
    }
}

