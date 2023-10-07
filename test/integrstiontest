// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import "../src/factory.sol";
import "../src/ICHILD.sol";

contract integrstionTest is Test {
    address user1 = 0x70997970C51812dc3A010C7d01b50e0d17dc79C8;
    address user2 = 0x976EA74026E726554dB657fA54763abd0C3a0aa9;
    address user3 = 0x23618e81E3f5cdF7f54C3d65f7FBc0aBf5B21E8f;



    StudentDetailsFactory _StudentDetailsFactory;
    uint studentId;

    address childContract;

    function setUp() public {
        vm.startPrank(user1);
        _StudentDetailsFactory = new StudentDetailsFactory();
    }

    function testDeployChild() public {
        childContract = _StudentDetailsFactory.createStudentDetails1();
    }

    function testzAdmitStudent() public {
        testDeployChild();
        studentId = ICHILD(childContract).admitStudent('AYO', 'MALE', 30);
    }

    function testExpelStudent() public {
        testzAdmitStudent();
        ICHILD(childContract).expelStudent(studentId);
    }

    function testGetStudentDetails() public {
        testExpelStudent();
        Student memory data = ICHILD(childContract).getStudentDetail(studentId);
        require(data.age == 0, "DATA STILL EXISTS");
    }

    function testMarkAttendance() public {
        testzAdmitStudent();
        ICHILD(childContract).markAttendance(studentId);
    }

    function testFailMarkAttendanceNew() public{
        testMarkAttendance();
        ICHILD(childContract).markAttendance(studentId);
    }

    function testPrincipal() public {
        testzAdmitStudent();
        vm.stopPrank();
        vm.prank(user2);
        require(ICHILD(childContract).viewPrincipal() == user1, "PRINCIPAL NOT USER1");
    }

    


    
}