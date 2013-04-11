
class Notification
  constructor: (@name, @body, @type) ->
  getName: -> @name
  getBody: -> @body
  getType: -> @type
  toString: ->
    "Notification Name: #{@name}
    \nBody: #{@body or null}
    \nType: #{@type or null}
    "
class Notifier
  facade : null
  constructor: -> 
    @facade = ApplicationFacade.getInstance()
  sendNotification: (name, body, type) ->
    @facade.sendNotification name, body, type

class Mediator extends Notifier
  constructor: ->
    super()
  notify: (note)->

class Ball extends Notifier
  constructor: (@limits)->
    super()
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
      @sendNotification 'REVERSE', self
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


class BallMediator extends Mediator
  constructor: (@ball, canvas)->
    super()
    @context = canvas.getContext '2d'

  draw: ->
    @context.fillStyle = "#00A308"
    @context.fillRect @ball.position.x, @ball.position.y, @ball.size, @ball.size

  notify: (note)->
  # Implement here ...
    switch note.name
      when 'REVERSE'
        ball = note.body
        SoundManager.play('fail')

class SoundManager
  instance = null
  @sounds = []
  constructor: ->
    @sounds = {}
  @register: (name, path)->
    @sounds[name] = new Audio path 
  @play:(name)->
    @sounds[name].play()
  @getInstance = ->
    instance ?= new SoundManager()

class ScoreMediator extends Notifier
  constructor: (@canvas)->
    super()
    @context = canvas.getContext '2d'

  draw: (p1,p2)->
    @context.font = "italic 20pt Calibri"
    @context.fillText "Score : "+p1+"/"+p2, 0, 20


#
# Init
#

class ApplicationMediator extends Notifier
  constructor: (canvas)->
    super()
    @context = canvas.getContext '2d'
  clear: ->
    canvas.getContext('2d').clearRect 0, 0, canvas.width, canvas.height

class ApplicationFacade
  instance = null
  views : null
  score: null
  constructor: ->
    @views = []
    @score = 
      p1: 0
      p2: 0
  main: ->
    for i in [1..4]
      ball = new Ball 
        x: canvas.width
        y: canvas.height
      ball.position.x = i * 10
      ball.position.y = i * 10
      ball.velocity.x = (i % 2) * -1 || 1
      if i == 2
        ball.velocity.y = (i % 2) * -1 || 1
      @registerObservers new BallMediator ball, canvas
    console.log @views
    balls = v.ball for v in @views
    scoreView = new ScoreMediator canvas
    setInterval ->
      app = ApplicationFacade.getInstance()
      for v in app.views

        for b1 in balls
          for b2 in balls
            b1.bounceOn b2 if b1.collides b2

        v.ball.move()
      clear()
      for v in app.views
        v.draw()
      scoreView.draw(app.score.p1,app.score.p2)
    , 5
  sendNotification: (name, body, type)->  
    @notifyObservers new Notification name, body, type
  notifyObservers: (note)->
   for v in @views
     v.notify note 
  
  registerObservers: (observer)->
    @views.push observer
    observer
  @getInstance = ->
    instance ?= new ApplicationFacade()

canvas = document.getElementsByTagName('canvas')[0]

clear= ->
  canvas.getContext('2d').clearRect 0, 0, canvas.width, canvas.height

SoundManager.register('fail', 'sounds/fail.wav')
app = ApplicationFacade.getInstance()
app.main()
