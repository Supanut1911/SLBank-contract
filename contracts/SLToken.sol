// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.0;
import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

contract SLToken is ERC20 {
  constructor() ERC20('SL Token', SLT) {
    _mint(msg.sender, 10**6 * 10**18);
  }
}