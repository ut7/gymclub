class @Ball

  constructor: (@position) ->
    @defaults =
      position:
        x: @position.x
        y: @position.y
      velocity:
        dx: 5
        dy: 3
    @size = 10
    @velocity =
      dx: 5
      dy: 5

  reset: =>
    @position =
      x: @defaults.position.x
      y: @defaults.position.y
    @velocity =
      dx: @defaults.velocity.dx
      dy: @defaults.velocity.dy
    @

  move: ->
    @position.x += @velocity.dx
    @position.y += @velocity.dy
    @

  onHit: (leverage, cb)->
    axes = leverage @position,
      x: @position.x + @velocity.dx
      y: @position.y + @velocity.dy
    cb axes if axes?
    @

  bounce: (axes)=>
    @velocity['d'+axes] = -@velocity['d'+axes]

if module?.exports?
  module.exports = @Ball
