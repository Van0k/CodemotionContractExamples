pragma solidity ^0.4.23;

interface IMintableToken {
  function mint(address to, uint256 value) external returns (bool);
  function totalSupply() external view returns (uint);
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

contract DutchAuction is Ownable {
    
    IMintableToken token;
    
    uint public maxCap;
    uint public startBlock;
    uint public endBlock;
    uint public bpPerBlock;
    uint public weiRaised = 0;
    
    mapping(address => uint) bids;
    
    modifier onlyWhenOngoing() {
        require(block.number < endBlock && block.number >= startBlock);
        _;
    }
    
    modifier onlyAfterSale() {
        require(block.number >= endBlock);
        _;
    }

    constructor(
        uint _maxCap,
        uint _startBlock,
        uint duration,
        address tokenAddress
    )
        public 
    {
        owner = msg.sender;
        maxCap = _maxCap;
        startBlock = _startBlock;
        endBlock = _startBlock + duration;
        
        token = IMintableToken(tokenAddress);
    }
    
    function() public payable {
        makeBid(msg.sender);
    }
    
    function makeBid(address _bidder) public payable onlyWhenOngoing {
        require(_bidder != 0x0);
        require(msg.value != 0);
        require(weiRaised + msg.value <= maxCap);
        
        bids[_bidder] = msg.value;
        
        weiRaised += msg.value;
        
        if (weiRaised == maxCap) {
            endBlock = block.number + 1;
        }
    }
    
    function receiveTokens() public onlyAfterSale {
        require(bids[msg.sender] != 0);
        
        uint saleDuration = endBlock - startBlock;
        uint soldSupply = (token.totalSupply()*bpPerBlock*saleDuration)/10**5;
        uint bidderFraction = (10**18 * bids[msg.sender]) / weiRaised;
        
        uint bidderTokens = (bidderFraction*soldSupply)/10**18;
        
        token.mint(msg.sender, bidderTokens);
    }
    
    function withdrawFunds(address withdrawAddress, uint amount)
        public
        onlyAfterSale
        onlyOwner 
    {
        require(withdrawAddress != 0x0);
        require(amount != 0);
        
        withdrawAddress.transfer(amount);
    }
}

