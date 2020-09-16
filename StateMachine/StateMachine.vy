
ACC: constant(String[20]) = "AcceptingBlindBids"
REV: constant(String[20]) = "RevealBids"
WIN: constant(String[20]) = "WinnerDetermined"
FIN: constant(String[20]) = "Finished"
stage: public(String[20])

@external
def __init__():
    self.stage = ACC

@internal
def nextStage():
    if self.stage == ACC:
        self.stage = REV
    elif self.stage == REV:
        self.stage = WIN
    elif self.stage == WIN:
        self.stage = FIN

@internal
def atStage(_stage:String[20]):
    assert _stage == self.stage

@internal
def transitionAfter():
    self.nextStage()

@payable
@external
def bid():
    self.atStage(ACC)
    # Implement biding here
    self.transitionAfter()

@external
def reveal():
    self.atStage(REV)
    #Implement reveal of bids here
    self.transitionAfter()

@external
def claimGoods():
    self.atStage(WIN)
    # Implement handling of goods here
    self.transitionAfter()

@external
def cleanup():
    self.atStage(FIN)
    # Implement cleanup of auction here
