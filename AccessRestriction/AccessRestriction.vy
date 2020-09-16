owner:public(address)
lastOwnerChange:public(uint256)
MINUTES:constant(uint256) = 60

@external
def __init__():
    self.owner = msg.sender
    self.lastOwnerChange = block.timestamp

@external
def changeOwner(_newOwner:address):
    assert msg.sender == self.owner
    assert block.timestamp >= self.lastOwnerChange + MINUTES
    self.owner = _newOwner
    self.lastOwnerChange = block.timestamp
