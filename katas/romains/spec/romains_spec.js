require('../lib/romains.js');

describe("convertis", function() {
  it("convertit 1 en I", function() {
    expect(convertis(1)).toEqual("I");
  });

  it("convertit 5 en V", function() {
    expect(convertis(5)).toEqual("V");
  });

});
