// playing with testcheck generators

var tc = require('testcheck/dist/testcheck.js');

// intermediary generator
var gen = tc.gen.oneOf([
    tc.gen.return("p"),
    tc.gen.return("o"),
    tc.gen.return("u")
    ]);

module.exports = {
  actionSequence: tc.gen.array(tc.gen.oneOf([
    tc.gen.return("get"),
    tc.gen.array([
      tc.gen.return("add"),
      tc.gen.int
      ])
    ])),

  chainGenerator: tc.gen.array([
      tc.gen.return("pouet"),
      tc.gen.return("popouetll"),
      tc.gen.return("pouet")
      ]),

  pouGen: tc.gen.array(gen)
};
