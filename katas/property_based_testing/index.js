require('mocha-testcheck').install();
var assert = require('assert');

describe('the sum of 2 numbers', function(){
  check.it('should be equal or lesser than any of the 2 numbers',
    [gen.int, gen.int],
    function(a, b){
      assert(a + b >= a && a + b >= b);
    });
});
