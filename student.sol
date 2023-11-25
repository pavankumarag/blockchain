pragma solidity ^0.8.0;
// SPDX-License-Identifier: GPL-3.0
contract degreeVerification{
    //roll(int) passingYear(int) major(string) finalcgpa(int) totalbacklogs(int) pendingbacklogs(int) phn_no(string) permanet_add(string)
//1. make a structure of name student    
        struct Student{
            uint256 rollNo;
            uint256 passingYear;
            string major;
            uint256 finalcgpa;
            uint256 totalbacklogs;
            uint256 pendingbacklogs;
            string phnNo;
            string permanent_address;

        }
//2. make a map(it will be DS to store student data
//3. make a function to take the parameter  in the structure as inouts and then we need to map it as student record
        mapping(bytes32=>Student) public students;
        event StudentAdded(bytes32 indexed hash, uint256 rollNo , uint256 passingYear, string major, uint256 finalcgpa, uint256 totalbacklogs, uint256 pendingbacklogs, string phnNo, string permanent_address);

//make a function : with parameters and try to include in hash
        function addStudent(uint256 _rollNo, uint256 _passingYear, string memory _major, uint256 _finalcgpa, uint256 _totalbacklogs, uint256 _pendingbacklogs, string memory _phnNo, string memory _permanent_address) public {
            bytes32 hash = keccak256(abi.encodePacked(_rollNo,_passingYear,_major, _finalcgpa, _totalbacklogs, _pendingbacklogs, _phnNo, _permanent_address));
        students[hash] = Student(_rollNo,_passingYear,_major, _finalcgpa, _totalbacklogs, _pendingbacklogs, _phnNo, _permanent_address);
        emit StudentAdded(hash, _rollNo, _passingYear, _major, _finalcgpa, _totalbacklogs, _pendingbacklogs, _phnNo, _permanent_address);
        }


}
