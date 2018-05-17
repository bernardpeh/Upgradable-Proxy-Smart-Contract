pragma solidity ^0.4.21;

import './LogicI.sol';
import './Storage.sol';

contract LogicOne is LogicI {
    
    Storage public s;

    constructor(Storage _s) public {
        s = _s;
    }

    function setVal(uint _val) public returns (bool success) {
        s.setVal(2 * _val);
        return true;
    }
}

