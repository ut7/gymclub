class @Playground

  constructor: (context) ->
    @width = context.width
    @height = context.height
    @top = 0
    @left = 0

  bouncables: (currentPos, nextPos) =>
    max = Math.max(currentPos.y, nextPos.y)
    min = Math.min(currentPos.y, nextPos.y)
    if max >= @height >= min or max >= @top >= min
      'y'
    else null
  
  exitables: (currentPos, nextPos) =>
    max = Math.max(currentPos.x, nextPos.x)
    min = Math.min(currentPos.x, nextPos.x)
    if max >= @width >= min or max >= @left >= min
      'x'
    else null

if module?.exports?
  module.exports = @Playground
