pragma solidity ^0.5.1;

contract dao is Ownable{
  address owner = msg.sender;
  mapping(address => uint256) public votes;
  address payable addr = address(uint160(address(this)));

  function sign() payable public {
    require(msg.value > 9 && msg.value % 10 == 0);
    votes[msg.sender] += msg.value / 10;
    addr.transfer(msg.value);
  }

  function propose() 
}