pragma solidity ^0.7.0;

contract ChecksEffectsInteractions {
    mapping(address => uint256) balances;

    function deposit() public payable {
        balances[msg.sender] = msg.value;
    }

    function withdraw(uint256 _amount) public {
        require(balances[msg.sender] >= _amount);

        balances[msg.sender] -= _amount;

        msg.sender.transfer(_amount);
    }
}
