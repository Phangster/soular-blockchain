pragma solidity >=0.4.21 <0.7.0;

contract EnergyContract{
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
  
  // Events - publicize actions to external listeners
  event LogDepositMade(address accountAddress, uint amount);
  event Creation(address accountAddress, uint quantity, uint price);
  event Bought(address fromAddress, address toAddress, uint contractID);
  
  mapping (address => uint) private balances;
  mapping (uint => Transaction) public transactions;
  
  /*ENERGY CONTRACT TRANSACTIONS*/ 
  function createEnergyContract(uint _seller, uint _kwh, uint _unitPrice) public payable {
    transactions[salesCounter] = Transaction({
        id: salesCounter,
        buyer_id: 0x00,
        seller_id: _seller,
        kwh: _kwh,
        uprice: _unitPrice
    });
    salesCounter = salesCounter + 1;
    emit Creation(msg.sender, _kwh, _unitPrice);
  }
  
  // seller address can get from the owner that created the contract
  function buyEnergyContract(address _purchaser, uint _id, uint _buyer) public payable {
    transactions[_id] = Transaction({
        id: salesCounter,
        buyer_id: _buyer,
        seller_id: transactions[_id].seller_id,
        kwh: transactions[_id].kwh,
        uprice: transactions[_id].uprice
    });
    emit Bought(msg.sender, _purchaser, _id);
  }
}
