// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ShubCoin is ERC20, Ownable {
    constructor() ERC20("ShubCoin", "SCN") {}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(msg.sender, 10000000000000000);
    }
}
