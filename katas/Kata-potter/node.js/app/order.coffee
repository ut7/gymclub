_ = require 'lodash'

class Order
  constructor: (@books=[]) ->

  biggestLot: ->
    _.uniq(@books)

  reduction: (lot) ->
    [1, 0.95][lot.length - 1]

  total: ->
    return 0 if @books.length == 0
    @biggestLot().length * 8 * @reduction(@biggestLot())


module.exports = Order
