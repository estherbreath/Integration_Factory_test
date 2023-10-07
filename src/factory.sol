// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;
import "./child.sol";


contract StudentDetailsFactory {
    // Hint: Is always a good practice to store the factory contract in your storage

    address[] studentDetails;

    function createStudentDetails1()
        external
        returns (address)
    {
        StudentDetails newstudentDetails = new StudentDetails(msg.sender);

        // newstudentDetails.admitStudent("Mars", "Male", 20);

        // newstudentDetails.getStudentDetail(1);
        // Saving to storage
        studentDetails.push(address(newstudentDetails));
        
        return(address(newstudentDetails));
    }

    function createStudentDetails2(
        address me
    ) external returns (StudentDetails newstudentDetails) {
        newstudentDetails = new StudentDetails(me);

        newstudentDetails.admitStudent("Mars Ifeanyi", "Male", 10);

        newstudentDetails.getStudentDetail(1);

        studentDetails.push(address(newstudentDetails));
    }

    
}