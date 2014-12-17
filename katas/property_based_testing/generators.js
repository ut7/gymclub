// playing with testcheck generators

var tc = require('testcheck/dist/testcheck.js');

actions = tc.gen.oneOf([
    tc.gen.return("get"),
    tc.gen.array([
      tc.gen.return("add"),
      tc.gen.int
      ])
    ]);


module.exports = actions;
