balances: HashMap[address,uint256]

@payable
@external
def deposit():
    self.balances[msg.sender] = msg.value

@external
def withdraw(_amount:uint256):
    assert self.balances[msg.sender] >= _amount
    self.balances[msg.sender] -= _amount
    send(msg.sender,_amount)
