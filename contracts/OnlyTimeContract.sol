// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.5.2;

// A public micro service
contract MyContract {
    uint256 public peopleCount = 0;
    mapping(uint => Person) public people;
    
    // expressed in seconds of epoch time
    // if before this time will not allow any interaction ie - addPerson cannot be called
    uint256 openingTime = 1635609350; 
    
    
    // block is another global variable like msg
    // using blocktimestamp to compare to openingTime
    // So... if it's being called after the openingTime will allow it
    // if not then no dice.
    modifier onlyWhileOpen() {
        require(block.timestamp >= openingTime);
        _; // This replaces the code  to run after the error check
    }

    struct Person {
        uint _id;
        string _firstName;
        string _lastName;
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
        onlyWhileOpen 
    {
        incrementCount();
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);
    }
    
    function incrementCount() internal {
        peopleCount += 1;
    }
    
    
    
}

