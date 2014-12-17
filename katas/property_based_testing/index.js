require('mocha-testcheck').install();
var assert = require('assert');

describe('the sum of 2 numbers', function(){
  check.it('should be equal or lesser than any of the 2 numbers',
    {times: 1000},
    [gen.posInt, gen.posInt],
    function(a, b){
      console.log(arguments);
      assert(a + b >= a && a + b >= b);
    });
});
