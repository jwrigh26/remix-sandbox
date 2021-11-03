// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.5.2;

// https://www.youtube.com/watch?v=on3SZ-BAFw8&list=PLS5SEs8ZftgUq-aMMYeKf8nPqHrNqa3Iu&index=5

// Each contract must be init with an address??
contract ERC20Token {
    string public name;
    mapping(address => uint256) public balances;
    
    constructor(string memory _name) public {
        name = _name;
    }
    
    function mint() public {
        balances[tx.origin] += 1;
    }
}

contract MyContract {
    address payable wallet;
    address public token;
    
    constructor (
        address payable _wallet,
        address _token
    )
       public {
           wallet = _wallet;
           token = _token;
       }
    
    function() external payable {
        buyToken();
    }
    
    function buyToken() public payable {
        // Type conversion from address to ERC20Token
        // This assumes that token is actually an ERC20Token
        ERC20Token(token).mint();
        wallet.transfer(msg.value);
    }
}