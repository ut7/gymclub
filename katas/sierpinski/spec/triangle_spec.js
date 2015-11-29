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
  it("affiche * pour un triangle non centré d'une ligne", function () {
    expect(Triangle.dessineTriangleDeSierpinski(1, centre=false)).toEqual(['*']); 
  });

  it("affiche * * pour la 3e ligne du triangle non centré", function () {
    expect(Triangle.dessineTriangleDeSierpinski(3, centre=false)[2]).toEqual('* *'); 
  });

  it("affiche **** pour la 4e ligne du triangle non centré", function () {
    expect(Triangle.dessineTriangleDeSierpinski(4, centre=false)[3]).toEqual('****'); 
  });

  it("affiche 5 espaces avant * pour la 1ere ligne d'un triangle centré de 6 lignes", function () {
    expect(Triangle.dessineTriangleDeSierpinski(6, centre=true)[0]).toEqual('     *'); 
  });

  it("affiche 3 espaces avant *. .* pour la 3ere ligne d'un triangle centré de 6 lignes", function () {
    expect(Triangle.dessineTriangleDeSierpinski(6, centre=true)[2]).toEqual('   *. .*'); 
  });
});
