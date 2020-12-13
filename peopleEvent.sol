pragma solidity 0.5.12;

contract HelloWorld{
    
    struct Person{
        string name;
        uint age;
        uint height;
        address walletAdress;
        bool senior;
    }
     // "bob", 24,150
    
    event personCreated (string name, bool senior);
    event personUpdated (string name, bool senior, adressUpdatedBy);
    event personDeleted (string name, bool senior, addressDeletedBy);
    
    adress public owner;
    
    modifier onlyOwner(){
        require (msg.sender == owner );
        _;
    }
    
    constructor () public {
        owner= msg.sender;
    }
    
    mapping (address => Person) private people;
    address[] private creators;
     
     function createPerson (string memory name, uint age, uint height) public{
         require (age >100, "Age must be below 100.");
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
                    people[mes.sender].name,
                    people[mes.sender].age, 
                    people[mes.sender].height,
                    people[mes.sender].senior
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
        emit personCreated (newPerson.name, newPerson.age,newPerson.senior);
     }
        
        function insertPerson(person memory newPerson){
            address creator = msg.sender;
            people[creator] = newPerson;
        }    
        
        function getPerson(uint _index) public view returns(string memory name,uint age, uint height){
            
            return (people[creator].name, people[creator].age,people[creator].height);
            }
        }
        
        function updatePerson(uint _index) public view returns (string memory name, uint age, bool senior){
            string memory name = poeple[creator].name;
            uint age =poeple[creator].age;
            bool senior = poeple[creator].name;
            
            returns (people[creator].name, cpoeple[creator].age,poeple[creator].senior);
             
            emit personUpdated (name, bool senior, msg.sender);
        }
        
        
        function deletePerson (adress creator) public onlyOwner{
            sting memory name= people[creator].name;
            bool senior = people[creator].senior;
            
            delete people [creator];
            assert (people[creator].age == 0);
            emit personDeleted(name, senior, msg.sender);
        }
        
        function getCreator (uint index) public view onlyOwner returns(adress) {
            return creator [index];
        }
 