pragma solidity ^0.7.0;

contract AccessRestriction {
    address public owner = msg.sender;
    uint256 public lastOwnerChange = block.timestamp;

    modifier onlyBy(address _account) {
        require(msg.sender == _account);
        _;
    }

    modifier onlyAfter(uint256 _time) {
        require(block.timestamp >= _time);
        _;
    }

    function changeOwner(address _newOwner)
        public
        onlyBy(owner)
        onlyAfter(lastOwnerChange + 1 minutes)
    {
        owner = _newOwner;
        lastOwnerChange = block.timestamp;
    }
}
