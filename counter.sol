pragma solidity ^0.4.0;

contract counter {
    uint private count=0;
    uint private add=1;
    address private  owner = msg.sender;

    function increment() public {
        require(owner == msg.sender);
        require(count + add >= count);
        count=count+add;
    }

    function get() public view returns (uint) {
        return count;
    }
}