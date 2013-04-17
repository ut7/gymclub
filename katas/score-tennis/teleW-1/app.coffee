console.log "Score tennis"

score = "AAABBBABABBB"

class Match
  constructor: (@_score)->
    @points =
      A: 
        game: 0
        point: 0
      B: 
        game: 0
        point: 0

  compute: ->
    for char in @_score
      @addPoint char

  addPoint: (who)->
    @points[who].point += 1
    other = if who is 'A' then 'B' else 'A'
    delta = @points[who].point - @points[other].point
    @addGame(who) if @points[who].point >= 4 and delta >= 2

  addGame: (who)->
    @points[who].game += 1
    @points.A.point = 0
    @points.B.point = 0

  inspect: ->
    console.log @points

match = new Match(score)
match.compute()
match.inspect()
