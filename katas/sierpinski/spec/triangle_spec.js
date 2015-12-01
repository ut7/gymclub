var Triangle=require('../lib/triangle.js');

describe('genereTriangleDeTriangle', function () {
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
});
