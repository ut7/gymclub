cv = document.getElementById "canvas"
ctx = cv.getContext "2d"

clear = ->
    ctx.fillStyle = "Yellow"
    ctx.fillRect 0, 0, cv.width, cv.height

listPoints= [ [100,100], [150,100], [150, 55], [150, 10], [180, 100] ]

addPoint = (x, y)->
    listPoints.push [x, y]
    
getReference = (points) ->
    points.reduce ([accX, accY], [x,y])->
      if y > accY || (x < accX && y == accY)
        [x,y]
      else
        [accX, accY]
        
sortByAngle = (points, reference) ->
    [xr, yr] = reference
    _(points).sort ([x, y])->
        dx = x - xr
        dy = y - yr
        hypo = Math.sqrt(dx*dx + dy*dy)
        -dx / hypo
   
    
redraw = ->
    clear()
    width = 10
    reference = getReference(listPoints)
    
    byAngle = sortByAngle(listPoints, reference)
    #alert byAngle
    for [x, y] in listPoints
        ctx.fillStyle = if _.isEqual [x,y], reference then "Green" else "red"
        ctx.fillRect x-width/2, y-width/2, width, width

redraw()
cv.addEventListener "click", (event)->
  addPoint(event.x - cv.offsetTop,
           event.y - cv.offsetLeft)
  redraw()



