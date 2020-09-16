interface EternalStorage:
    def getUint(_key:bytes32) -> uint256:view
    def setUint(_key:bytes32,_value:uint256):nonpayable
    def deleteUint(_key:bytes32):nonpayable

eternalStorageAdr:EternalStorage

@external
def setStorageAdr(_address:address):
    self.eternalStorageAdr = EternalStorage(_address)

@view
@external
def getBalance(_input:bytes32) -> uint256:
    return self.eternalStorageAdr.getUint(keccak256(_input))

@external
def setBalance(_input:bytes32,_value:uint256):
    self.eternalStorageAdr.setUint(keccak256(_input),_value)

@external
def deleteBalance(_input:bytes32):
    self.eternalStorageAdr.deleteUint(keccak256(_input))

@pure
@external
def whoAreYou() -> String[20]:
    return "I am ContractV2"