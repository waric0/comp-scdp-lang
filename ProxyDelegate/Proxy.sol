pragma solidity ^0.7.0;

contract Proxy {
    address delegate;
    address owner = msg.sender;

    function upgradeDelegate(address _newDelegateAddress) public {
        require(msg.sender == owner);
        delegate = _newDelegateAddress;
    }

    fallback() external payable {
        require(delegate != address(0));
        assembly {
            let _target := sload(0)
            calldatacopy(0x0, 0x0, calldatasize())
            let result := delegatecall(
                gas(),
                _target,
                0x0,
                calldatasize(),
                0x0,
                0
            )
            returndatacopy(0x0, 0x0, returndatasize())
            switch result
                case 0 {
                    revert(0, 0)
                }
                default {
                    return(0, returndatasize())
                }
        }
    }
}