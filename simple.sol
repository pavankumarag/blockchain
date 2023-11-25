/ SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WeiTransferContract {
    address public sender;
    address public recipient;
    uint256 public amount = 1 ether;

    constructor(address _recipient) {
        sender = msg.sender;
        recipient = _recipient;
    }

    function sendWei() public payable {
        require(msg.sender == sender, "Only the sender can send Wei");
        require(msg.value == amount, "Must send exactly 1 wei");
    }

    function receiveWei() public payable {
        require(msg.sender == recipient, "Only the recipient can receive Wei");
        require(address(this).balance >= amount, "Contract balance is insufficient");
        payable(recipient).transfer(amount);
    }
}
