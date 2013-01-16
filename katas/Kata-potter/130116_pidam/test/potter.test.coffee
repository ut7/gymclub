expect = require "expect.js"
cost   = require "../src/potter"

describe "Mon calculateur de prix", ->
  it "works", ->
    expect(cost([])).to.equal(0)
    expect(cost([0])).to.equal(8)
    expect(cost([0, 1])).to.equal(8 * 0.95 * 2)
    expect(cost([0, 0])).to.equal(8 * 2)
    expect(cost([1, 1, 1, 1])).to.equal(8 * 4)
    expect(cost([0, 1, 2, 3, 4])).to.equal(8 * 5 * 0.75)
    expect(cost([0, 0, 1, 1, 2, 3, 4, 4])).to.equal(8 * (5 * 0.75 + 3 * 0.90))
