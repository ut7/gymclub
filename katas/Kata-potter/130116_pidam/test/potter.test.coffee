expect = require "expect.js"
prixTotal = require "../src/potter"

describe "Mon calculateur de prix", ->
  it "devrait valoir 0 si l'on n'achete rien", ->
    expect(prixTotal([])).to.equal(0)

  it "devrait renvoyer le prix du livre s'il n'y a qu'un livre", ->
    expect(prixTotal([0])).to.equal(8)

  it "applique une reduction de 5% sur 2 livres differents", ->
    expect(prixTotal([0, 1])).to.equal(8 * 0.95 * 2)

  it "n'applique pas la réduction si on a deux livres identiques", ->
    expect(prixTotal([0, 0])).to.equal(8 * 2)
