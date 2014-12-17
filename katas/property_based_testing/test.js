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


describe('The stack', function(){
  var referenceLength;
  var myStack;
  check.it('has a consistent length',
    [actions],
    function(actionSeq){
      console.log('------ \n');
      referenceLength = 0;
      myStack = stack();

      console.log(actionSeq);
      actionSeq.forEach(function(action){
        applyAction(myStack, action);

        if (action === "get" && referenceLength > 0)
          referenceLength--;
        if ((action instanceof Array) && action[0] === "add")
          referenceLength++;

        assert(referenceLength === myStack.length());
      });
    });
});
