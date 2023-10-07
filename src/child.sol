// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;
import "forge-std/console2.sol";

contract StudentDetails {
    address principal;
    address public Deployer;

    struct Student {
        string name;
        uint age;
        string gender;
    }

    uint id;

    mapping(uint => Student) iDToStudent;
    mapping(uint => bool) attendance;

    event Admitted(
        string indexed _name,
        string indexed _gender,
        uint indexed _age,
        uint id
    );

    constructor(address _principal) {
        principal = _principal;
        Deployer = msg.sender;
    }

    modifier onlyPrincipal() {
        require(msg.sender == principal, "Not Principal");
        _;
    }

    function admitStudent(
        string memory _name,
        string memory _gender,
        uint _age
    ) external onlyPrincipal returns (uint){
        console2.log("first");
        id = id + 1;
        Student memory newStudent;
        newStudent.name = _name;
        newStudent.gender = _gender;
        console2.log("second");
        newStudent.age = _age;
        console2.log("third");
        iDToStudent[id] = newStudent;
        emit Admitted(_name, _gender, _age, id);
        return(id);
    }

    function expelStudent(uint _id) external onlyPrincipal {
        delete iDToStudent[_id];

    }

    function getStudentDetail(
        uint _id
    ) external view returns (Student memory s) {
        s = iDToStudent[_id];
    }

    function markAttendance(uint _id) external returns (bool) {
        require( attendance[_id] == false, "ALREADY PRESENT");
        attendance[_id] = true;
        return true;
    }

    function viewPrincipal() view external returns (address) {
        return principal;
    }
}

