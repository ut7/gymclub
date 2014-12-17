require('mocha-testcheck').install();

var assert = require('assert'),
    tc     = require('testcheck/dist/testcheck'),
    stack  = require('./chpillade'),
    actions= require('./generators');

function applyAction(target, action) {
  if (!(action instanceof Array)) action = [action];

  var fn = target[action[0]],
      args = action.slice(1);

  fn.apply(target, args);
}

var referenceLength = 0;

describe('The stack', function(){
  check.it('has a consistent length',
    [actions],
    function(action){
      applyAction(stack, action);

      if (action === "get" && referenceLength > 0)
        referenceLength--;
      if ((action instanceof Array) && action[0] === "add")
        referenceLength++;

      assert(referenceLength === stack.length());
    });
});
