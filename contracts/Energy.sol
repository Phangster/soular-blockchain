pragma solidity >=0.4.21 <0.7.0;

contract Energy{
    
    address public owner;
    uint salesCounter;
    constructor() public {
      owner = msg.sender;
      salesCounter = 0;
    }
    
    struct Transaction {
      uint id;
      uint buyer_id;
      uint seller_id;
      uint kwh;
      uint uprice;
    }
    
    mapping (uint => Transaction) public transactions;
    mapping (uint => uint) public sellable;
    mapping (uint => uint) public credit;
    
    /*ENERGY CONTRACT TRANSACTIONS*/ 
    
    function sell(uint _seller, uint _kwh) public {
        sellable[_seller] += _kwh;
    }
    
    // seller address can get from the owner that created the contract
    function buy(uint _buyer, uint _seller, uint _kwh, uint _uprice) public payable {
      uint total_price = _uprice*_kwh;
      require(_kwh > 0 && credit[_buyer] >= total_price);
      credit[_buyer] -= total_price;
      credit[_seller] += total_price;
      sellable[_seller] -= _kwh;
      transactions[salesCounter] = Transaction({
        id: salesCounter,
        buyer_id: _buyer,
        seller_id: _seller,
        kwh: _kwh,
        uprice: _uprice
      });
    }
    
    function topup(uint _toaccount, uint _amount) public {
      require(_amount > 0);
      credit[_toaccount] += _amount;
    }
}