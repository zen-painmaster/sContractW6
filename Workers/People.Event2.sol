import "./ownable.sol";
import "./selfdestruct.sol";
pragma solidity 0.5.12;

contract PeopleEvent is Ownable {
    
    struct Person{
        string name;
        uint age;
        uint height;
        address walletAdress;
        bool senior;
    }
     // "bob", 24,190
    
    event personCreated (string name, bool senior, address createdBy );
    event personUpdated (string name, bool senior, address UpdatedBy );
    event personDeleted (string name, bool senior, address DeletedBy );
    
    address public owner;

    
    mapping (address => Person) private people;
    address[] private creators;
     
     function createPerson (string memory name, uint age, uint height) internal {
         require (age < 100, "Age must be below 100.");
         address creator = msg.sender;
        
        Person memory newPerson;
        newPerson.name = name;
        newPerson.age = age;
        newPerson.height = height;
        newPerson.walletAdress = creator;
        
        if (age >= 65) {
            newPerson.senior = true ;
        }
        else{
            newPerson.senior = false;
        }
        
        insertPerson(newPerson);
        creators.push (msg.sender);
        assert ( 
            keccak256(
                abi.encodePacked (
                    people[msg.sender].name,
                    people[msg.sender].age, 
                    people[msg.sender].height,
                    people[msg.sender].senior
                )
            )
            ==
            keccak256(
                abi.encodePacked(
                newPerson.name,
                newPerson.age,
                newPerson.height,
                newPerson.senior
                )
            )
        ); 
        emit personCreated (newPerson.name,newPerson.senior, msg.sender);
     }
        
        function insertPerson(Person memory newPerson) internal{
            address creator = msg.sender;
            people[creator] = newPerson;
        }    
        
        function getPerson() public view returns(string memory name,uint age, uint height){
            address creator = msg.sender;
            return (people[creator].name, people[creator].age, people[creator].height);
            }
        
         function updatePerson (string memory name, uint age, uint height) public{
         require (age < 100, "Age must be below 100.");
         address creator = msg.sender;
            require (creator == people[creator].walletAdress,"This person does not exist.");

        Person memory newPerson;
        newPerson.name = name;
        newPerson.age = age;
        newPerson.height = height;
        
        if (age >= 65) {
            newPerson.senior = true ;
        }
        else{
            newPerson.senior = false;
        }
        
        assert ( 
            keccak256(
                abi.encodePacked (
                    people[msg.sender].name,
                    people[msg.sender].age, 
                    people[msg.sender].height,
                    people[msg.sender].senior
                )
            )
            !=
            keccak256(
                abi.encodePacked(
                newPerson.name,
                newPerson.age,
                newPerson.height,
                newPerson.senior
                )
            )
        );   
            insertPerson(newPerson);
            emit personUpdated (newPerson.name, newPerson.senior, msg.sender);
        }
        
        
        function deletePerson (address creator) public onlyOwner{ 
            delete people [creator];
            assert (people[creator].age == 0);
            emit personDeleted(people [creator].name, people [creator].senior, msg.sender);
        }
        
        function getCreator (uint index) public view onlyOwner returns(address) {
            return creators [index];
        }
}
 