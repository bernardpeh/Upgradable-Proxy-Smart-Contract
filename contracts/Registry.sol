pragma solidity ^0.4.21;

import './Ownable.sol';
import './Storage.sol';

// https://blog.indorse.io/ethereum-upgradeable-smart-contract-strategies-456350d0557c
contract Registry is Storage, Ownable {

    address public logic_contract;

    // admin to set contract
    function setLogicContract(address _c) public onlyOwner returns (bool success){
        logic_contract = _c;
        return true;
    }

    // proxy fall back is so that we can access all admin functions in the storage contract
    function () payable public {

        address target = logic_contract;

        assembly {
            // Copy the data sent to the memory address starting 0x40
            let ptr := mload(0x40)
            calldatacopy(ptr, 0, calldatasize)

            // Proxy the call to the contract address with the provided gas and data
            let result := delegatecall(gas, target, ptr, calldatasize, 0, 0)

            // Copy the data returned by the proxied call to memory
            // http://solidity.readthedocs.io/en/v0.4.24/assembly.html
            let size := returndatasize
            returndatacopy(ptr, 0, size)

            // Check what the result is, return and revert accordingly
            switch result
            case 0 { revert(ptr, size) }
            case 1 { return(ptr, size) }
        }
    }

}
