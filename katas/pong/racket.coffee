class @Racket

  constructor: (@position) ->
    @defaults =
      position:
        x: @position.x
        y: @position.y
    @size = 100
    @velocity =
      dx: 0
      dy: 0

  reset: =>
    @position =
      x: @defaults.position.x
      y: @defaults.position.y
    @

  move: ->
    @position.x += @velocity.dx
    @position.y += @velocity.dy
    @

  stop: =>
    @velocity.dx = 0
    @velocity.dy = 0
    @
  
  onHit: (leverage, cb)->
    axes = leverage @position,
      x: @position.x + @velocity.dx
      y: @position.y + @velocity.dy
    cb axes if axes?
    @

  bouncables: (currentPos, nextPos) =>
    maxX = Math.max currentPos.x, nextPos.x
    minX = Math.min currentPos.x, nextPos.x
    maxY = Math.max currentPos.y, nextPos.y
    minY = Math.min currentPos.y, nextPos.y
    x = maxX >= @position.x >= minX
    top = @position.y + @size >=  currentPos.y >= @position.y
    if x and top
      'x'
    else null

if module?.exports?
  module.exports = @racket
