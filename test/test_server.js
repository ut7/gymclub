let assert = require('assert');

describe("hello", function() {
    it("renvoie hello", function() {
	assert.equal(server(), "hello");
    });
});
