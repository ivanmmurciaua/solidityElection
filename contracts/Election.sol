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

	// Store accounts that have voted
	mapping (address => bool) public voters;

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

	// Update candidate vote count
	function ballotToVote(uint _candidateId) public {
		// Require that they haven't voted before
		require(!voters[msg.sender], "You've already voted");

		// Require a valid candidate
		require(_candidateId > 0 && _candidateId <= candidatesCount);

		// Record that voter has voted
		voters[msg.sender] = true;

		// Store ballot
		candidates[_candidateId].voteCount++;
	}
}