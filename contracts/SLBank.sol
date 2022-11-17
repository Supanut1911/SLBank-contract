// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.0;

import './interfaces/ISLBank.sol';
import '@openzeppelin/contracts/token/ERC20/IERC20.sol';


contract SLBank is ISLBank{

  mapping (address => uint256) private _balance;
    IERC20 private slToken;
    // address private token;

  constructor(address slToken_){
    slToken = IERC20(slToken_);
    // token = slToken_;
  }

  //max index = 3
  event Deposite(address indexed from, uint256 amount);
  event Withdraw(address indexed to, uint256 amount);
  event Transfer(address indexed from, address indexed to, uint256 amount);



  function getBalance() external view override returns (uint256) {
    return _balance[msg.sender];
  }

  function deplosit(uint256 amount) external override {
    _balance[msg.sender] += amount;
    slToken.transferFrom(msg.sender, address(this), amount);
    emit Deposite(msg.sender, amount);
  }

  function withdraw(uint256 amount) external override{
    _balance[msg.sender] -= amount;
    slToken.transfer(msg.sender, amount);
    emit Withdraw(msg.sender, amount);
  }

  function transfer(address to, uint256 amount) external override{
    _balance[to] += amount;
    _balance[msg.sender] -= amount;
    emit Transfer(msg.sender, to, amount);
  }


  
}