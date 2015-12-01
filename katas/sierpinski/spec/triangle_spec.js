var Triangle=require('../lib/triangle.js');

describe('genereTriangleDePascal', function () {
  it('doit renvoyer 1 pour un triangle à une ligne', function () {
    expect(Triangle.genereTriangleDePascal(1)[0]).toEqual([1]);
  });

  it('doit renvoyer 1,1 pour un triangle à 2 lignes', function () {
    expect(Triangle.genereTriangleDePascal(2)[1]).toEqual([1,1]);
  });

  it('doit renvoyer 1,2,1 pour un triangle à 3 lignes', function () {
    expect(Triangle.genereTriangleDePascal(3)[2]).toEqual([1,2,1]);
  });
});

describe('dessineTriangleDeSierpinski', function () {
  it("affiche * pour un triangle d'une ligne", function () {
    expect(Triangle.dessineTriangleDeSierpinski(1)).toEqual(['*']); 
  });

  it("affiche * * pour la 3e ligne du triangle", function () {
    expect(Triangle.dessineTriangleDeSierpinski(3)[2]).toEqual('* *'); 
  });

  it("affiche **** pour la 4e ligne du triangle", function () {
    expect(Triangle.dessineTriangleDeSierpinski(4)[3]).toEqual('****'); 
  });

  it("affiche '*.*.*.*' pour la 4ere ligne d'un triangle centré de 4 lignes", function () {
    expect(Triangle.dessineTriangleDeSierpinski(4, true)[3]).toEqual('*.*.*.*');
  });

  it("affiche '   *' pour la 1ere ligne d'un triangle centré de 4 lignes", function () {
    expect(Triangle.dessineTriangleDeSierpinski(4,true)[0]).toEqual('   *'); 
  });

  it("affiche '  *.*' pour la 2eme ligne d'un triangle centré de 4 lignes", function () {
    expect(Triangle.dessineTriangleDeSierpinski(4,true)[1]).toEqual('  *.*'); 
  });
});
