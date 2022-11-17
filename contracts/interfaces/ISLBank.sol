// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >=0.5.0;

interface ISLBank {
  function deplosit(uint256 amount) external;

  function withdraw(uint256 amount) external;

  function transfer(address to, uint256 amount) external;

  function getBalance() external view returns (uint256);
}