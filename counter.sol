pragma solidity ^0.4.0;

contract counter {
    uint private counter=0;
    uint private add=1;
    uint private  check=0;
    address private  owner = msg.sender;

    function increment() public {
        require(owner == msg.sender);
        check = counter + add;
        require(check >= counter);
        counter++;
    }

    function get() public view returns (uint) {
        require(check >= counter);
        return counter;
    }
}