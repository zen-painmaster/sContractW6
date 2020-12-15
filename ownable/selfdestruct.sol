  import "./ownable.sol";
  pragma solidity 0.5.12;
  
  contract destroyable is Ownable {
      function desteroy () public onlyOwner {
          address payable receiver = msg.sender;
          selfdestruct(receiver);
      }
  }  