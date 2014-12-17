// playing with testcheck generators

var tc = require('testcheck/dist/testcheck.js');

var chainGenerator = tc.gen.array([
      tc.gen.return("pouet"),
      tc.gen.return("popouetll"),
      tc.gen.return("pouet")
      ]);

var gen = tc.gen.oneOf([
    tc.gen.return("p"),
    tc.gen.return("o"),
    tc.gen.return("u")
    ]);

var pouGen = tc.gen.array(gen);

module.exports ={
  pouGen: pouGen,
  chainGenerator: chainGenerator
};
