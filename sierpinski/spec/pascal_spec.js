var pascal = require('../lib/pascal')

describe("Triangle de Pascal", function() {
  it('doit renvoyer comme premiere ligne 1', function() {
    expect(pascal()[0]).toEqual([1]);
  });
  
  it('doit renvoyer comme deuxieme ligne 1, 1', function() {
    expect(pascal(1)[1]).toEqual([1,1]);
  });
  
})