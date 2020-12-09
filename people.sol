pragma solidity 0.5.12;

contract HelloWorld{
    
    struct Person{
        uint id;
        string name;
        uint age;
        uint height;
        address walletAdress;
    }
    
    Person[] private people;
    //  mapping (address => Person) public people;
     
     // "bob", 24,150
     
     function createPerson (string memory name, uint age, uint height) public{
         address creator = msg.sender;
        
        Person memory newPerson;
        
        newPerson.id = people.length;
        newPerson.name = name;
        newPerson.age = age;
        newPerson.height = height;
        newPerson.walletAdress = creator;
       
        people.push (newPerson);
        //people[creator] = newPerson;
        }  
        
        function getPerson(uint _index) public view returns(string memory name,uint age, uint height){
            
            return (people[_index].name, people[_index].age,people[_index].height);
            }
        
        }
 