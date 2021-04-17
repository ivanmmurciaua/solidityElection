pragma solidity ^0.5.16;

/**
 * The Election contract
 */
contract Election {

	// Model a candidate
	struct Candidate {
		uint id;
		string name;
		uint voteCount;
	}

	// Fetch & Store candidates
	mapping (uint => Candidate) public candidates;

	// Store candidates count
	uint public candidatesCount;

	// Constructor
	constructor() public {
		addCandidate("Satoshi");
		addCandidate("Vitalik");
	}

	// Function to add a candidate to the system
	function addCandidate (string memory _name) private {
		candidatesCount++;
		candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
	}
}