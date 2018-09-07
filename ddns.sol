pragma solidity 0.4.24;

contract DDNS {
    
    struct OrderStruct {
        uint ip;
        string name;
        address domain_owner;
        bool isSold;
    }
    
    address private  owner = msg.sender;
    mapping(string => OrderStruct) buyer;
    
    
    function buyDomain(string domain) public payable {
        require(buyer[domain].isSold == false);
        require(msg.value == 1 ether && msg.sender.balance >= 1);
        buyer[domain] = OrderStruct(0, domain, msg.sender, true);
        uint money = 1;
        msg.sender.transfer(money);
    }
    
    function setIP(string domain, uint ip) public {
        require(buyer[domain].domain_owner == msg.sender);
        buyer[domain].ip = ip;
    }
    
    function getIP(string domain) public returns (uint) {
        require(owner == msg.sender);
        return buyer[domain].ip;
    }
    
    function withdraw(uint value) public {
        //wizardry
    }
}