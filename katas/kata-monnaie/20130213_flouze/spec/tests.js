describe("Le monnayeur", function () {
  it("sait monnayer des pièces de cuivre", function () {
    expect(monnaye(1)).toEqual([[0, 0, 0, 1]]);
    expect(monnaye(5)).toEqual([[0, 0, 0, 5]]);
  });
});