pragma solidity ^0.7.0;

import "./EternalStorage.sol";

contract ContractV2 is EternalStorage {
    EternalStorage eternalStorageAdr;

    function setStorageAdr(address _address) public {
        eternalStorageAdr = EternalStorage(_address);
        require(msg.sender == owner);
    }

    function getBalance(bytes memory _input) public view returns (uint256) {
        return eternalStorageAdr.getUint(keccak256(_input));
    }

    function setBalance(bytes memory _input, uint256 _amount) public {
        eternalStorageAdr.setUint(keccak256(_input), _amount);
    }

    function deleteBalance(bytes memory _input) public {
        return eternalStorageAdr.deleteUint(keccak256(_input));
    }

    function whoAreYou() public pure returns (string memory) {
        return "I am ContractV2";
    }
}
