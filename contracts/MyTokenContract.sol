// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.5.2;

// https://www.youtube.com/watch?v=BHdPZWRjtgc&list=PLS5SEs8ZftgUq-aMMYeKf8nPqHrNqa3Iu&index=4 
// In order for an address to accept credit,
// it needs to be marked payable see Address docs
// https://docs.soliditylang.org/en/v0.8.9/types.html?highlight=payable#address

contract MyTokenContract {
    mapping(address => uint256) public balances;
    address payable wallet;
    
    // indexed modifier allows us to listen to events specific to a certain variable
    // we can subscribe based on specific address in this case.
    event Purchase(
        address indexed _buyer,
        uint256 _amount
    );
    
    constructor(address payable _wallet) public {
        wallet = _wallet;
    }
    
    // Fallback function
    // public can be called inside our contract but external can only be called outside the contract
    // Basicall lets someone paste their address and it will buy a token for them.
    function() external payable {
        buyToken();
    }
    
    function buyToken() public payable {
        // buy a buyToken
        balances[msg.sender] += 1;
        // send ether to the wallet
        wallet.transfer(msg.value);
        // buyer is sender and amoutn is 1
        emit Purchase(msg.sender, 1);
    }
}