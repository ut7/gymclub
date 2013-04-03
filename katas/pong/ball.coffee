class @Ball

  constructor: (@position) ->
    @size = 10
    @velocity =
      dx: 1
      dy: -1

  move: ->
    @position.x += @velocity.dx

    if @position.y < 1
      @velocity.dy = 1

    @position.y += @velocity.dy

if module?.exports?
  module.exports = @Ball
