Order = require('../app/order')
should = require 'should'

it 'Order is a function', ->
  Order.should.be.a 'function'

describe 'Order', ->
  beforeEach ->
    @order = new Order()

  it 'Order can have books as initialize', ->
    @order.total().should.eql 0

  describe 'with one book', ->
    beforeEach ->
      @order.books = [0]

    it 'have a price', ->
      @order.total().should.eql 8

    describe 'with two different book', ->
      beforeEach ->
        @order.books.push 1

      it 'have a price with a reduction', ->
        @order.total().should.eql (2 * 8 * 0.95)
