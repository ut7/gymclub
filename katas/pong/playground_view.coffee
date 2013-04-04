class @PlaygroundView

  constructor: (@el) ->
    @context = @el.getContext('2d')
    @rackets = []

  clear: ->
    @context.fillStyle = 'rgba(255, 228, 225, 0.3)'
    @context.fillRect(0, 0, @el.width, @el.height)
    @

  draw: ->
    @context.fillStyle = 'black'
    @context.fillRect(@ball.position.x, @ball.position.y, @ball.size, @ball.size)
    for racket in @rackets
      @context.fillRect(racket.position.x, racket.position.y, 2, racket.size)
    @

if module?.exports?
  module.exports = @PlaygroundView
