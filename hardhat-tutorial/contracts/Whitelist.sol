//SPDX-License-Identifier: Unlicensed
//contract address : 0x1C84dDbd2626639aeF083A84868F8deaD95C1B7a
pragma solidity ^0.8.4;

contract Whitelist {

    //Max nummber of whitelisted addresses allowed
    uint8 public maxWhitelistedAddresses;

    //Create a mapping of whitelistedAddresses
    //if an address is whitelisted, we would set it to true, it is false by default to all other addresses
    mapping(address => bool) public whitelistedAddresses;

    // numAddressesWhitelisted would be used to keep track of how many addresses have been whitelisted
    
    uint8 public numAddressesWhitelisted;

    //Setting the Max number of whitelisted addresses
    //User will put the value at the time of deployment
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    /**
    addAddressToWhitelist - This function adds the address of the sender to the whitelist
     */
     function addAddressToWhitelist() public {
         //check if the user has already been whitelisted
         require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");
         //check if the numAddressesWhitelisted < maxWhitelistedAddresses
         require (numAddressesWhitelisted < maxWhitelistedAddresses, "More addresses can't be added, limit reached");
         whitelistedAddresses[msg.sender] = true;
         //Increase the number of whitelisted addresses
         numAddressesWhitelisted +=1;
    }
}