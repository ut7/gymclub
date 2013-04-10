
canvas = document.getElementsByTagName('canvas')[0]

class Ball
  constructor: (@limits)->
    @position =
      x: @limits.x / 2
      y: @limits.y / 2
    @velocity =
      x: 1
      y: 1
    @size = Math.ceil(Math.random() * 100)

  move: ->
    if @position.y + @size >= @limits.y or @position.y <= 0
      @velocity.y *= -1
    if @position.x + @size >= @limits.x or @position.x <= 0
      @velocity.x *= -1
    @position.x += @velocity.x
    @position.y += @velocity.y

  collides: (b)->
    return false if b is @
    Math.abs(@position.x + @velocity.x - b.position.x - b.velocity.x) < @size and Math.abs(@position.y + @velocity.y - b.position.y - b.velocity.y) < @size

  bounceOn: (b)->
    @velocity.x *= -1 if @velocity.x / b.velocity.x < 0
    @velocity.y *= -1 if @velocity.y / b.velocity.y < 0

clear = ->
  canvas.getContext('2d').clearRect 0, 0, canvas.width, canvas.height

class BallView
  constructor: (@ball, canvas)->
    @context = canvas.getContext '2d'

  draw: ->
    @context.fillRect @ball.position.x, @ball.position.y, @ball.size, @ball.size

ball = new Ball 
  x: canvas.width
  y: canvas.height
ball1 = new Ball 
  x: canvas.width
  y: canvas.height
ball1.position.x = 1
ball1.position.y = 1
geishaBall = new Ball 
  x: canvas.width
  y: canvas.height
geishaBall.position.x = 10
geishaBall.position.y = 10

list = for i in [1..50]
         ball = new Ball 
           x: canvas.width
           y: canvas.height
         ball.position.x = i * 10
         ball.position.y = i * 10
         ball.velocity.x = (i % 2) * -1 || 1
         if i == 2
           ball.velocity.y = (i % 2) * -1 || 1
         new BallView ball, canvas

balls = v.ball for v in list

setInterval ->
  for v in list

    for b1 in balls
      for b2 in balls
        b1.bounceOn b2 if b1.collides b2

    v.ball.move()
  clear()
  for v in list
    v.draw()
, 5
