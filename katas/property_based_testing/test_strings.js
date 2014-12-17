require('mocha-testcheck').install();

var assert = require('assert'),
    tc     = require('testcheck/dist/testcheck'),
    gen    = require('./generators'),
    pouet  = gen.chainGenerator,
    pou    = gen.pouGen,
    chaines  = require('./2_strings');


describe('The chaines function returned value', function(){
  this.timeout(10000);
  check.it('gives expected value',
    [pouet],
    function(args){
      var a = args[0],
          b = args[1],
          expected = args[2];

      var result = chaines(a, b);

      assert(result === expected);
    });

  check.it('is contained by both strings',
    [pou, pou],
    function(a, b){
      a = a.join('');
      b = b.join('');
      var result = chaines(a, b);

      console.log('--------');
      console.log(a);
      console.log(b);
      console.log('---- res:');
      console.log(result);
      assert(a.indexOf(result) != -1);
      assert(b.indexOf(result) != -1);
    });
});
