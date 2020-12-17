import "./PeopleEvent1.sol";
pragma solidity 0.5.12;

contract workers is Ownable, PeopleEvent{
    
    mapping (address => uint ) public Salary;

      function createWoker (string memory name, uint age, uint height, uint amount) public{
          require (age <= 75, "Age needs to be below 75");
          Salary[msg.sender] = amount ;
          createPerson (name,age,height) ;
      }
    
    function fireWorker (address creator) public onlyOwner{
        Salary[creator] = 0;
        deletePerson (creator);
        }
    }
    
    //"steven",75, 170,180