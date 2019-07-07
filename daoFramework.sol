pragma solidity ^0.5.1;

contract dao{
  address owner = msg.sender;
  mapping(address => uint256) public votes;
  address payable addr = address(uint160(address(this)));

  function sign() payable public {
    require(msg.value > 9);
    votes[msg.sender] = msg.value;
    addr.transfer(msg.value);
  }

  function unsign() payable public {
    delete votes[msg.sender];
  }
}
