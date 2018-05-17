pragma solidity ^0.4.21;

import './Ownable.sol';
import './Storage.sol';

// https://blog.indorse.io/ethereum-upgradeable-smart-contract-strategies-456350d0557c
// entry contract
contract Registry is Ownable {
    
    Storage public storage_contract;

    constructor() public {
        storage_contract = new Storage();
    }

    // proxy fall back is so that we can access all storage functions from this contract
    function () payable public {

        address target = address(storage_contract);

        assembly {
            // Copy the data sent to the memory address starting 0x40
            let ptr := mload(0x40)
            calldatacopy(ptr, 0, calldatasize)

            // Proxy the call to storage contract with the provided gas and data
            let result := delegatecall(gas, target, ptr, calldatasize, 0, 0)

            // Copy the data returned by the proxied call to memory
            let size := returndatasize
            returndatacopy(ptr, 0, size)

            // Check what the result is, return and revert accordingly
            switch result
            case 0 { revert(ptr, size) }
            case 1 { return(ptr, size) }
        }
    }

}
