// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.2;

contract Certification {
    address public owner;

    // Define roles
    address public adminRole;
    address public verifierRole;

    // Events to log role assignments
    event AdminRoleAssigned(address indexed admin);
    event VerifierRoleAssigned(address indexed verifier);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    modifier onlyAdmin() {
        require(msg.sender == adminRole, "Only admin can call this function");
        _;
    }

    modifier onlyVerifier() {
        require(msg.sender == verifierRole, "Only verifier can call this function");
        _;
    }

    struct Certificate {
        address candidate_address;
        address org_address;
        string course_name;
        uint256 expiration_date;
        string ipfsLink;
        bool isLocked;
        address unlocker;
    }

    event certificateGenerated(bytes32 _certificateId);
    event certificateLocked(bytes32 _certificateId, address indexed unlocker);
    event certificateUnlocked(bytes32 _certificateId, address indexed unlocker);

    mapping(bytes32 => Certificate) public certificates;

    function stringToBytes32(string memory source) private pure returns (bytes32 result) {
        bytes memory tempEmptyStringTest = bytes(source);
        if (tempEmptyStringTest.length == 0) {
            return 0x0;
        }
        assembly {
            result := mload(add(source, 32))
        }
    }

    constructor() {
        owner = msg.sender;
        adminRole = msg.sender; // Owner is initially assigned the admin role
        emit AdminRoleAssigned(msg.sender);
    }

    // Function to assign the verifier role
    function assignVerifierRole(address _verifier) public onlyAdmin {
        verifierRole = _verifier;
        emit VerifierRoleAssigned(_verifier);
    }

    function generateCertificate(string memory _id, address _candidate_name, address  _org_name, string memory _course_name, uint256 _expiration_date, string memory _ipfsLink) public {
        bytes32 byte_id = stringToBytes32(_id);
        require(certificates[byte_id].expiration_date == 0, "Certificate with given id already exists");
        owner = _candidate_name;
        adminRole = _candidate_name;
        certificates[byte_id] = Certificate(_candidate_name, _org_name, _course_name, _expiration_date, _ipfsLink, false, address(0));
        emit certificateGenerated(byte_id);
    }

    function lock(bytes32 byte_id, address _unlockerAddress) public {
        // bytes32 byte_id = stringToBytes32(_id);
        require(certificates[byte_id].expiration_date != 0, "Certificate does not exist");
        require(msg.sender == certificates[byte_id].candidate_address || msg.sender == certificates[byte_id].org_address, "Not authorized to lock the certificate");
        require(!certificates[byte_id].isLocked, "Certificate is already locked");
        certificates[byte_id].isLocked = true;
        certificates[byte_id].unlocker = _unlockerAddress;
        emit certificateLocked(byte_id, _unlockerAddress);
    }

    function unlock(bytes32 byte_id) public {
        // bytes32 byte_id = stringToBytes32(_id);
        require(certificates[byte_id].expiration_date != 0, "Certificate does not exist");
        require(certificates[byte_id].isLocked, "Certificate is not locked");
        require(msg.sender == certificates[byte_id].unlocker || msg.sender == owner, "Not authorized to unlock the certificate");

        certificates[byte_id].isLocked = false;
        certificates[byte_id].unlocker = address(0);
        emit certificateUnlocked(byte_id, msg.sender);
    }

    function getData(bytes32 byte_id) public view returns (address candi ,address org, string memory, uint256, string memory) {
        // bytes32 byte_id = stringToBytes32(_id);
        Certificate memory temp = certificates[byte_id];
        require(temp.expiration_date != 0, "No data exists");

        if (temp.isLocked) {
            // except the IPFS link
            return (temp.candidate_address, temp.org_address, temp.course_name, temp.expiration_date, "");
        } else {
            // return all information including the IPFS link
            return (temp.candidate_address, temp.org_address, temp.course_name, temp.expiration_date, temp.ipfsLink);
        }
    }
}
