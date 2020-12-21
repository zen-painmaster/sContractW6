pragma solidity 0.05.12;
import "./ownable.sol";

contract ERC20 is ownable {
    
    string private _name;
    string private _symbol;
    uint8 private _decimals;

    uint 256 private _totalSupply;
    
    mapping ( address => uint256) private _blances;
    
    constructor(string memory name, string memory symbol, uint8 decimals ) public
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
    } 
    function name() public view returns (string memory) {
        return _name;
    }

    function symbol() public view returns (string memory) {
        return _symbol;
    }

    function decimals() public view returns (uint8) {
        return _decimals;
    }

    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }
    function balanceOf(address account) public view onlyOwner returns (uint256) {
        return _blances[account];
    }

    function mint(address account, uint256 amount) public onlyOwner{
        require (account !=adress(0), "mint to the zeor address");
        
        _totalSupply = _totalSupply + amount;
        _balances[account] =_balances [account] + amount;
    }

    function transfer(address recipient, uint256 amount) public returns (bool) {
        if (_balances[msg.sender] >= amount) {
            _balancess[msg.sender] = _balancess[msg.sender] -amount:
            _balancess[recipient]  = _balancess[recipient] + amoutn: 
            
        } else {
            return false ,"insufficient balance.";
        }
        
    }