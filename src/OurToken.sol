// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract OurToken is ERC20 {
    constructor(uint256 intialSupply) ERC20("Our Token", "OT"){
        _mint(msg.sender, intialSupply);
    }
}