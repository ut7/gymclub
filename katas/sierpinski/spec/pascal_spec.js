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

  it ('doit renvoyer 300 elements quand on demande le nb d elements d un triangle de 300 lignes', function() {
    expect(Pascal.triangle(300)[299].length).toEqual(300);
  });
});
