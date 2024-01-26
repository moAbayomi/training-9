// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

contract Thrift {
    uint256 public overallBal;

    event Funded(uint256 indexed amount, address indexed funder);

    event Withdrawn(uint256 indexed amount, address indexed withdrawer);

    mapping(address => Participant) public addressToParticipant;

    struct Participant {
        uint256 amountThrifted;
        uint256 time;
    }

    function fund() external payable {
        require(msg.value > 0, "amount cant be zero, sorry");
        addressToParticipant[msg.sender] = Participant(
            msg.value,
            block.timestamp
        );
        overallBal += msg.value;
        emit Funded(msg.value, msg.sender);
    }

    function checkMyBal() external view returns (uint256) {
        return addressToParticipant[msg.sender].amountThrifted;
    }

    function withdraw(uint amount) external returns (bool) {
        uint256 balance = addressToParticipant[msg.sender].amountThrifted;
        require(amount > 0 && balance >= amount, "lmao");

        addressToParticipant[msg.sender].amountThrifted -= amount;
        overallBal -= amount;


        
        // using the call method instead of transfer requires manually checking success returned true
        // we're relying on the require to revert if success came out false in this case
       // (bool success,) = msg.sender.call{value:amount}("");
       // require(success, "withdraw failed");
       // return success;

        // the transfer method is really just cleaner, it reverts if anything funny happens with the withdraw 
        // too much coconut oil, organic coconut oil that is
        payable(msg.sender).transfer(amount);
        emit Withdrawn(amount, msg.sender);
        return true;
    }
}
