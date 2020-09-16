owner:address
isStopped:bool

@external
def __init__():
    self.owner = msg.sender
    self.isStopped = False

@external
def stopContract():
    assert msg.sender == self.owner
    self.isStopped = True

@external
def resumeContract():
    assert msg.sender == self.owner
    self.isStopped = False

@payable
@external
def deposit():
    assert not(self.isStopped)
    # Deposit logic happening here

@external
def emergencyWithdraw():
    assert self.isStopped
    # Emergency withdraw happening here
