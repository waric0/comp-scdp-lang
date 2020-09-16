pragma solidity ^0.7.0;

contract EternalStorage {
    address owner = msg.sender;
    address latestVersion;

    mapping(bytes32 => uint256) uIntStorage;

    modifier onlyLatestVersion() {
        require(msg.sender == latestVersion);
        _;
    }

    function upgradeVersion(address _newVersion) public {
        require(msg.sender == owner);
        latestVersion = _newVersion;
    }

    function getUint(bytes32 _key) external view returns (uint256) {
        return uIntStorage[_key];
    }

    function setUint(bytes32 _key, uint256 _value) external onlyLatestVersion {
        uIntStorage[_key] = _value;
    }

    function deleteUint(bytes32 _key) external onlyLatestVersion {
        delete uIntStorage[_key];
    }
}
