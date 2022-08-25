//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract Lottery {
    
     address payable[] public participants;
     address public admin;

     constructor(){
         admin = msg.sender;
     }

    modifier onlyAdmin {
        require(msg.sender == admin);
        _;
    }

    modifier checkEtherValue {
         require(msg.value == 1 ether);
         _;
    }


    function randomNum() public view returns(uint) {
       return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, block.number, participants.length)));
    }

    function getBalance() public view onlyAdmin returns(uint){
        return address(this).balance;
    }

    function findWinner() public  onlyAdmin {
        require(participants.length >= 3);


        uint random = randomNum();
        address payable winner;

        uint index = random % participants.length;
        winner = participants[index];
        winner.transfer(getBalance());
    }
    // recieve one ether from participants
     receive() external payable checkEtherValue{ 
         participants.push(payable(msg.sender));
     }

     fallback() external payable{

     }
}