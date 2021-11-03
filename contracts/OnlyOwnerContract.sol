// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.5.2;

// A public micro service
contract MyContract {
    uint256 public peopleCount = 0;
    mapping(uint => Person) public people;
    
    address owner; // msg.sender gets compared to this variable.
    
    // Custom modifier
    // Make sure whoever is calling the smart contract is the owner.
    modifier onlyOwner() {
        // msg: solidity global key word for meta-data that gets passed in.
        // msg.sender: Basically tells us who called this func.
        // Checker: if true it passes, if false it throws an error.
        require(msg.sender == owner);
        _;
    }

    struct Person {
        uint _id;
        string _firstName;
        string _lastName;
    }
    
    constructor() public {
        // Set owner to the sender address or the person who deployed the smart contract.
        owner = msg.sender;
    }
    
    //
    // Custom modifier to only allow the owner of the contract to be able to add people.
    // This is done by adding a the custom modifier: "onlyOwner"
    //
    function addPerson(
        string memory _firstName,
        string memory _lastName
        ) 
        public 
        onlyOwner 
    {
        incrementCount();
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);
    }
    
    function incrementCount() internal {
        peopleCount += 1;
    }
    
    
    
}

