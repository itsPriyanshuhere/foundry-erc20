//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract  ManualToken {

    mapping (address => uint256) s_balances;

    function name() public pure returns (string memory) {
        return "Manual Token";
    }

    function totalSupply() public pure returns(uint256) {
        return 100 ether;
    }

    function decimals() public pure returns(uint8){
        return 18;
    }

    function balanceOf(address _owner) public view returns (uint256 balance){
        return s_balances[_owner];
    }

    function transfer(address _to, uint256 _amount) public {
    uint256 senderBalance = balanceOf(msg.sender);
    uint256 receiverBalance = balanceOf(_to);

    require(senderBalance >= _amount, "Insufficient balance");

    // Update balances using external function calls
    s_balances[msg.sender] = senderBalance - _amount;
    s_balances[_to] = receiverBalance + _amount;

    // Check that the total balance remains unchanged
    require(balanceOf(msg.sender) + balanceOf(_to) == senderBalance + receiverBalance);
}

}