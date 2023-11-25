// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract testStruct{

    struct Student {
        uint256 rollNumber;
        string name;
        string email;
    }

    uint count = 0;
    mapping(uint256 => Student) public student;
    event AddStudent(uint id, string name, string email);

    function addToStudent(uint _rollNumber, string memory _name, string memory _email) public {
        uint id = count;
        student[id] = Student(_rollNumber, _name, _email);
        count++;

        emit AddStudent(_rollNumber, _name, _email);
    }

}
