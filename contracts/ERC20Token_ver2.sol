// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.5.2;

// https://www.youtube.com/watch?v=on3SZ-BAFw8&list=PLS5SEs8ZftgUq-aMMYeKf8nPqHrNqa3Iu&index=5

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

contract MyToken is ERC20Token {
    string public symbol;
    address[] public owners;
    uint256 ownerCount;
    
    constructor (
        string memory _name,
        string memory _symbol
    )
        ERC20Token(_name)
    public {
        symbol = _symbol;
    }
    
    function mint() public {
        super.mint();
        ownerCount += 1;
        owners.push(msg.sender);
    }
}