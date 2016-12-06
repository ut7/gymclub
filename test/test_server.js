let assert = require('assert');
let server= require('../index');

describe("hello", function() {
    it("renvoie hello", function() {
	assert.equal(server(), "hello");
    });
});
