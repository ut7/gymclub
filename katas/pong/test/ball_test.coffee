Ball = require('../ball')
expect = require('expect.js')

describe 'Ball', ->
  it 'to be defined', ->
    expect(Ball).to.be.defined
    expect(Ball).to.be.a 'function'

describe 'touch a border', ->
  it 'changes direction', ->
    ball = new Ball
      x: 200
      y: 0
    ball.move()
    expect(ball.position.y).to.eql 1
