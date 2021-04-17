pragma solidity ^0.5.16;

/**
 * The Election contract
 */
contract Election {

	// The candidate
	string public candidate;
	
	// Constructor
	constructor() public {
		candidate = "Satoshi";
	}
}