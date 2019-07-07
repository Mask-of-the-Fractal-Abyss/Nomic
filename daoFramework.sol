pragma solidity ^0.5.1;

contract dao{
  address[] public rules;

  function ammend(address old, address new_) payable public{
    require(msg.value > 4);
    for(uint i = 0; i < rules.length; i++){
      if (rules[i] == old) {
        rules[i] = new_;
        break;
      }
    }
  }

  function add(address addition) payable public{
    require(msg.value > 9);
    rules.push(addition);
  }

  function repeal(address target) public{
    for(uint i = 0; i < rules.length; i++){
      if (rules[i] == target){
        delete rules[i];
        break;
      }
    }
  }
}

contract timedEvent{
  uint reward;
  uint time;
  address payable addr = address(uint160(address(this)));
  constructor(uint r, uint t) payable public{
    require(r == msg.value);
    addr.transfer(msg.value);
    reward = r;
    time = t;
  }

  function claim() public{
    require(now >= time);
    msg.sender.transfer(reward);
  }
}