var Triangle = require('../lib/sierpinski.js');

describe('genereCourbeSierpinski', function () {
  it("renvoie 'A' pour une profondeur de 0", function() {
    expect(Triangle.genereCourbeSierpinski(0)).toEqual('A');
  });

  it("renvoie 'B-A-B' pour une profondeur de 1", function() {
    expect(Triangle.genereCourbeSierpinski(1)).toEqual('B-A-B');
  });


  it("renvoie 'A+B+A-B-A-B-A+B+A' pour une profondeur de 2", function() {
    expect(Triangle.genereCourbeSierpinski(2)).toEqual('A+B+A-B-A-B-A+B+A');
  });
});
