owner:address
latestVersion:address

uIntStorage: HashMap[bytes32,uint256]

@external
def __init__():
    self.owner = msg.sender

@external
def upgradeVersion(_newVersion:address):
    assert msg.sender == self.owner
    self.latestVersion = _newVersion

@view
@external
def getUint(_key:bytes32) -> uint256:
    return self.uIntStorage[_key]

@external
def setUint(_key:bytes32,_value:uint256):
    self.uIntStorage[_key] = _value

@external
def deleteUint(_key:bytes32):
    self.uIntStorage[_key] = 0