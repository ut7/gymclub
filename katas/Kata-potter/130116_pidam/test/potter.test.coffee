expect = require "expect.js"
prixTotal = require "../src/potter"

describe "Mon calculateur de prix", ->
  it "devrait valoir 0 si l'on n'achete rien", ->
    expect(prixTotal([])).to.equal(0)
    expect(prixTotal([0])).to.equal(8)
    expect(prixTotal([0, 1])).to.equal(8 * 0.95 * 2)
    expect(prixTotal([0, 0])).to.equal(8 * 2)
    expect(prixTotal([1, 1, 1, 1])).to.equal(8 * 4)
    expect(prixTotal([0, 1, 2, 3, 4])).to.equal(8 * 5 * (1 - 0.25))
