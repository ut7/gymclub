var expect = require("expect.js");
var monnaye = require("./monnaye");

describe("Un monnayeur", function () {
  it("monnaie avec des pièces de cuivre", function () {
    expect(monnaye(1)).to.eql([[0, 0, 0, 1]]);
    expect(monnaye(2)).to.eql([[0, 0, 0, 2]]);
  });

  it("peut retourner plusieurs combinaisons", function () {
    expect(monnaye(7)).to.eql([[0, 0, 1, 0], [0, 0, 0, 7]]);
  });

  it("peut cumuler plusieurs sortes de pièces dans une même combinaison", function () {
    expect(monnaye(8)).to.eql([[0, 0, 1, 1], [0, 0, 0, 8]]);
  });

  it("peut cumuler plusieurs fois la même sorte de pièce", function () {
    expect(monnaye(14)).to.eql([[0, 1, 0, 3], [0, 0, 2, 0], [0, 0, 1, 7], [0, 0, 0, 14]]);
  });

  it("peut scaler", function () {
    expect(monnaye(11)).to.eql([[0, 1, 0, 0], [0, 0, 1, 4], [0, 0, 0, 11]]);
    expect(monnaye(18)).to.eql([[0, 1, 1, 0], [0, 1, 0, 7], [0, 0, 2, 4], [0, 0, 1, 11], [0, 0, 0, 18]]);
    expect(monnaye(22)).to.eql([
      [1, 0, 0, 1],
      [0, 2, 0, 0],
      [0, 1, 1, 4],
      [0, 1, 0, 11],
      [0, 0, 3, 1],
      [0, 0, 2, 8],
      [0, 0, 1, 15],
      [0, 0, 0, 22]]);
  });
});
