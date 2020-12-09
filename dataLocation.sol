pragma solidity 0.5.1;
contract MemoryAndStorage {

    struct UserObj {
        uint id;
        uint balance;
    }
  
    mapping(uint => UserObj ) users;  

    function addUser(uint id, uint balance) public {
        users[id] = UserObj (id, balance);
    }

    function updateBalance(uint id, uint balance) public {
         users[id].balance = balance;  // this update must be in the storage not the memory to be read outside this function.
        
    }

    function getBalance(uint id) view public returns (uint) {
        return users[id].balance;
    }

}
