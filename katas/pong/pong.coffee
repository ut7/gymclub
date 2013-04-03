canvas = document.getElementById('pong')
context = canvas.getContext('2d')

ball = new Ball
  x: canvas.width / 2
  y: canvas.height / 4

updateView = ->
  context.fillStyle = 'rgba(255, 228, 225, 0.3)'
  context.fillRect(0, 0, canvas.width, canvas.height)
  ball.move()
  context.fillStyle = 'black'
  context.fillRect(ball.position.x, ball.position.y, ball.size, ball.size)

setInterval updateView, 5
