var Triangle = require('../lib/sierpinski.js');

describe('transformA', function () {
  it("renvoie 'B-A-B'", function() {
    expect(Triangle.transformA()).toEqual('B-A-B');
  });
});
