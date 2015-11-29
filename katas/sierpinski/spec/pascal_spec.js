var Pascal=require('../lib/pascal.js');

describe('genereTriangleDePascal', function () {
  it('doit renvoyer 1 pour un triangle à une ligne', function () {
    expect(Pascal.genereTriangle(1)[0]).toEqual([1]);
  });

  it('doit renvoyer 1,1 pour un triangle à 2 lignes', function () {
    expect(Pascal.genereTriangle(2)[1]).toEqual([1,1]);
  });

  it('doit renvoyer 1,2,1 pour un triangle à 3 lignes', function () {
    expect(Pascal.genereTriangle(3)[2]).toEqual([1,2,1]);
  });
});

describe('dessineTriangleDeSierpinski', function () {
  it("affiche * pour un triangle d'une ligne", function () {
    expect(Pascal.dessineTriangleDeSierpinski(1)).toEqual(['*']); 
  });

  it("affiche * * pour la 3e ligne du triangle", function () {
    expect(Pascal.dessineTriangleDeSierpinski(3)[2]).toEqual('* *'); 
  });

  it("affiche **** pour la 4e ligne du triangle", function () {
    expect(Pascal.dessineTriangleDeSierpinski(4)[3]).toEqual('****'); 
  });
});
