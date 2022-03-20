// SPDX-License-Identifier:UNLICENSE
pragma solidity ^0.8.7;

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol';

contract MyMjay is ERC20 {
    address public admin;
    constructor() ERC20('My Mjay', 'MJY') {
        _mint(msg.sender,1000000 * 10 ** 18);
        admin = msg.sender;   
    }

    function mint(address to, uint amount) external {
        require(msg.sender == admin, 'only admin');
        _mint(to, amount);
    }
    function buyToken(address reciever) public payable {
        uint256 amount = msg.value;

        uint256 tokenAmount = amount * 1000;
        _mint(reciever, tokenAmount);
    }

}