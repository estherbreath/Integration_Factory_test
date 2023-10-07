// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

    struct Student {
        string name;
        uint age;
        string gender;
    }

interface ICHILD {


        function admitStudent(
        string memory _name,
        string memory _gender,
        uint _age
    ) external returns(uint);

       function expelStudent(uint _id) external ;

    function getStudentDetail(
        uint _id
    ) external view returns (Student memory s);

    function markAttendance(uint _id) external returns (bool) ;
    function viewPrincipal() view external returns (address);
}