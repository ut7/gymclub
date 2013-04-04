el = document.getElementById('pong')
playgroundView = new PlaygroundView el
playground = new Playground el

ball = new Ball
  x: playground.width / 4
  y: playground.height / 1.5

playgroundView.ball = ball

racket1 = new Racket
  x: playground.width - 3
  y: 60
racket2 = new Racket
  x: 3
  y: 60

window.addEventListener 'keydown', (event)->
  console.log event.keyCode
  if event.keyCode is 65
    racket2.velocity.dy--
  if event.keyCode is 81
    racket2.velocity.dy++
  if event.keyCode is 38
    racket1.velocity.dy--
  if event.keyCode is 40
    racket1.velocity.dy++

playgroundView.rackets.push racket1
playgroundView.rackets.push racket2

updateView = ->
  racket1
    .onHit(playground.bouncables, racket1.stop)
    .move()
  racket2
    .onHit(playground.bouncables, racket2.stop)
    .move()
  ball
    .onHit(playground.bouncables, ball.bounce)
    .onHit(racket1.bouncables, ball.bounce)
    .onHit(racket2.bouncables, ball.bounce)
    .onHit(playground.exitables, ball.reset)
    .move()
  playgroundView
    .clear()
    .draw()

setInterval updateView, 1000 / 100
