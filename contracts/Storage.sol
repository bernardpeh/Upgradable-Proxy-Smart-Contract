pragma solidity ^0.4.21;
  
import './Ownable.sol';

// accessible only by the registry
contract Storage is Ownable {

    uint public val;
    address public logic_contract;

    modifier onlyLogic () {
        require(msg.sender == logic_contract);
        _;
    }

    function setLogicContract(address _contract) public onlyOwner returns (bool success){
        logic_contract = _contract;
        return true;
    }

    // only validated logic contract can change val
    function setVal(uint _val) public onlyLogic returns (bool success) {
        val = _val;
    }
}
