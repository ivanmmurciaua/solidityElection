// Requiring Election contract
var Election = artifacts.require("./Election.sol");

contract("Election", function(accounts) {

	//Check if constructor works fine
	it("Constructor initializes with two candidates", function() {
		return Election.deployed().then(function(instance) {
			return instance.candidatesCount();
		}).then(function(count) {
			assert.equal(count, 2);
		});
	});

	// Check if constructor inserts the correct values
	it("Constructor initializes the candidates with the correct values", function() {
		return Election.deployed().then(function(instance) {
			electionInstance = instance;
			return electionInstance.candidates(1);
		}).then(function(candidate) {
			assert.equal(candidate[0], 1, "Contains the correct id");
			assert.equal(candidate[1], "Satoshi", "Contains the correct name");
	      	assert.equal(candidate[2], 0, "Contains the correct votes count");
	      	return electionInstance.candidates(2);
	      }).then(function(candidate) {
	      	assert.equal(candidate[0], 2, "Contains the correct id");
	 		assert.equal(candidate[1], "Vitalik", "Contains the correct name");
	      	assert.equal(candidate[2], 0, "Contains the correct votes count");
	    });
	});

});