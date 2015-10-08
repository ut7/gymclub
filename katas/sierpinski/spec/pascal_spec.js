var Pascal = require('../lib/pascal')

describe("Triangle de Pascal", function() {
  it('doit renvoyer comme premiere ligne 1', function() {
    expect(Pascal.triangle(1)).toEqual([[1]]);
  });
  
  it('doit renvoyer comme deuxieme ligne 1, 1', function() {
    expect(Pascal.triangle(2)).toEqual([[1],[1,1]]);
  });

  it('doit renvoyer comme troisieme ligne 1,2, 1', function() {
    expect(Pascal.triangle(3)).toEqual([[1],[1,1],[1,2,1]]);
  });
  
  it('doit renvoyer comme quatrieme ligne 1,3,3,1', function() {
    expect(Pascal.triangle(4)).toEqual([[1],[1,1],[1,2,1],[1,3,3,1]]);
  });

  it('doit renvoyer comme cinquieme ligne 1,4,6,4,1', function() {
    expect(Pascal.triangle(5)).toEqual([[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]);
  });
  
  
  it('doit renvoyer 500 lignes et la 500e ligne doit être composée de 500 éléments', function() {
    expect(Pascal.triangle(500).length).toEqual(500);
    expect(Pascal.triangle(500)[499].length).toEqual(500);
  });
  
  
  
})