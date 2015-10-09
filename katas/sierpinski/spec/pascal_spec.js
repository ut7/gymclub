var Pascal = require('../lib/pascal');

describe('pascal', function() {
  it('doit renvoyer 1 quand on demande une ligne', function() {
    expect(Pascal.triangle(1)).toEqual([[1]]);
  });

  it ('doit renvoyer 1,1 quand on demande 2 lignes', function() {
    expect(Pascal.triangle(2)).toEqual([[1],[1,1]]);
  });

  it ('doit renvoyer 1,2,1 quand on demande 3 lignes', function() {
    expect(Pascal.triangle(3)).toEqual([[1],[1,1],[1,2,1]]);
  });
});
