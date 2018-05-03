pragma solidity ^0.4.23;

interface IMintableToken {
  function mint(address to, uint256 value) external returns (bool);
}

contract Ownable {
  address public owner;

  constructor() public {
    owner = msg.sender;
  }

  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }
  
}

contract Pausable is Ownable {
    
  bool public paused = false;

  modifier whenNotPaused() {
    require(!paused);
    _;
  }

  modifier whenPaused() {
    require(paused);
    _;
  }

  function pause() public onlyOwner whenNotPaused {
    paused = true;
  }

  function unpause() public onlyOwner whenPaused {
    paused = false;
  }
}


contract CappedSale is Pausable {
    
    IMintableToken token;
    
    uint public maxCap;
    uint public exchangeRate;
    uint public weiRaised = 0;

    constructor(
        uint _maxCap,
        uint _exchangeRate,
        address tokenAddress
    )
        public 
    {
        owner = msg.sender;
        maxCap = _maxCap;
        exchangeRate = _exchangeRate;
        
        token = IMintableToken(tokenAddress);
    }
    
    function buyTokens(address buyer) public payable whenNotPaused {
        require(buyer != 0x0);
        require(msg.value != 0);
        require(weiRaised + msg.value <= maxCap);
        
        uint boughtTokens = getValueWithBonus(exchangeRate*msg.value);
        weiRaised += msg.value;
        
        token.mint(buyer, boughtTokens);
        
    }
    
    function getValueWithBonus(uint value) private view returns (uint) {
        // Specific bonus calcualtion rules here.
        return value;
    }
    
    function withdrawFunds(address withdrawAddress, uint amount)
        public 
        onlyOwner 
    {
        require(withdrawAddress != 0x0);
        require(amount != 0);
        
        withdrawAddress.transfer(amount);
    }
}

