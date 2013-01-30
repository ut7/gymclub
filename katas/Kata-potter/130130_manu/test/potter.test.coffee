expect = require "expect.js"
potter = require "../lib/potter"

describe "Le calculateur de prix", ->
  calculePrix = potter.calculePrix

  it "ne détruit pas la liste initiale", ->
    l = [1, 2, 3]
    calculePrix l
    expect(l).to.eql [1, 2, 3]

  it "renvoie 0 si aucun livre acheté", ->
    expect(calculePrix []).to.eql 0

  it "renvoie 8 par livres identiques achetés", ->
    expect(calculePrix [0]).to.eql 8
    expect(calculePrix [0, 0]).to.eql 16

  it "déduit une réduction pour différents livres achetés", ->
    expect(calculePrix [0, 1]).to.eql 15.2
    expect(calculePrix [0, 1, 2]).to.eql 21.6
    expect(calculePrix [0, 1, 2, 3]).to.eql 25.6
    expect(calculePrix [0, 1, 2, 3, 4]).to.eql 30

  it "applique les réductions au lot concerné uniquement", ->
    expect(calculePrix [0, 0, 1]).to.eql 23.2

  it "sait gérer les cas tordus 5-3 vs 4-4", ->
    expect(calculePrix [0, 0, 1, 1, 2, 2, 3, 4]).to.eql 51.2

describe "Le constructeur de lots", ->
  construisLotsParTaille = potter.construisLotsParTaille

  it "sait correctement découper un achat de trois livres", ->
    expect(construisLotsParTaille [0, 0, 1]).to.eql [2, 1]
    expect(construisLotsParTaille [0, 1, 2]).to.eql [3]

  it "sait gérer le cas 5-3 vs 4-4", ->
    expect(construisLotsParTaille [0, 0, 1, 1, 2, 2, 3, 4]).to.eql [4, 4]
    expect(construisLotsParTaille [0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 4, 4]).to.eql [4, 4, 4, 4]
