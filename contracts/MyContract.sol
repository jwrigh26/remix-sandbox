// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.5.2;

// A public micro service
contract MyContract {
    
    // Working with Structs, arrays, and mappings
    
    // This is the better way. Ussing a Mapping or HashMap or Dic
    uint256 public peopleCount = 0;
    
    // If you provide a bogus key, it will return default values for the Person struct
    mapping(uint => Person) public people;
    
    
    // Working with Arrays. There is now way to itterate an Array
    // Next best thing is to keep a peopleCount to keep track of index length
    // Has to be a better way...right?
    
    // Person[] public people;
    // uint256 public peopleCount;
    
    
    struct Person {
        uint _id;
        string _firstName;
        string _lastName;
    }
    
    function addPerson(string memory _firstName, string memory _lastName) public {
        // By using a mapping:
        peopleCount += 1;
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);
        
        // If just using an array you could do the following:
        // people.push(Person(_firstName, _lastName));
        // peopleCount += 1;
    }
    
    
    
    
    // How to use Enums
    
    // enum State { Waiting, Ready, Active }
    // State public state;
    
    // constructor() public {
    //   state = State.Waiting; 
    // }
    
    // function activate() public {
    //     state = State.Active;
    // }
    
    // function isActive() public view returns(bool) {
    //     return state == State.Active;
    // }
    
    
    // DataTypes
    
    // string public constant stringValue = "myValue";
    // bool public myBool = true;
    // int public myInt = -1;
    // uint public myUint = 1;
    // uint8 public myUint8 = 8;
    // uint256 public my256Uint = 256;
    
    // function get() public view returns(string memory) {
    //      return value;
    // }
    
    // function set(string memory _value ) public {
    //     value = _value;
    // }
}

