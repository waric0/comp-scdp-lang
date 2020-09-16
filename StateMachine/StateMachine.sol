pragma solidity ^0.7.0;

contract StateMachine {
    enum Stages {AcceptingBlindBids, RevealBids, WinnerDetermined, Finished}

    Stages public stage = Stages.AcceptingBlindBids;

    modifier atStage(Stages _stage) {
        require(stage == _stage);
        _;
    }

    modifier transitionAfter() {
        _;
        nextStage();
    }

    function bid()
        public
        payable
        transitionAfter
        atStage(Stages.AcceptingBlindBids)
    {
        // Implement biding here
    }

    function reveal() public transitionAfter atStage(Stages.RevealBids) {
        // Implement reveal of bids here
    }

    function claimGoods()
        public
        transitionAfter
        atStage(Stages.WinnerDetermined)
    {
        // Implement handling of goods here
    }

    function cleanup() public atStage(Stages.Finished) {
        // Implement cleanup of auction here
    }

    function nextStage() internal {
        stage = Stages(uint256(stage) + 1);
    }
}
