var transformA = function () {
  return 'B-A-B';
}

var transformB = function () {
  return 'A+B+A';
}

var convert = function (sequence) {
  return sequence.split('').map(function (character) {
    switch(character) {
      case 'A':
        return transformA();
        break;
      case 'B':
        return transformB();
        break;
      default:
        return character;
    }
  }).join('');
}

var genereCourbeSierpinski = function (depth) {
  if (depth === 0) return 'A';
  return convert(genereCourbeSierpinski(depth - 1));
}

var drawSierpinski = function (depth, start_x, start_y, distance, canvas_id) {
  var ctx = initialize(start_x, start_y, canvas_id);
  sequence = genereCourbeSierpinski(depth);
  console.log("sequence: " + sequence);
  sequence.split('').forEach(function (character) {
    switch(character) {
      case 'A':
        drawForward(ctx, distance);
        break;
      case 'B':
        drawForward(ctx, distance);
        break;
      case '+':
        turnLeft(ctx, distance);
        break;
      case '-':
        turnRight(ctx, distance);
        break;
    }
  });
  ctx.stroke();
}

var initialize = function (start_x, start_y, canvas_id) {
  var canvas = document.getElementById(canvas_id);
  var ctx = canvas.getContext('2d');
  ctx.beginPath();
  ctx.translate(start_x,start_y);
  ctx.moveTo(0,0);
  return ctx;
}

var drawForward = function (ctx, distance) {
  ctx.lineTo(distance,0);
}

var turnLeft = function (ctx, distance) {
  ctx.translate(distance,0);
  ctx.rotate(-Math.PI / 3);
}

var turnRight = function (ctx, distance) {
  ctx.translate(distance,0);
  ctx.rotate(Math.PI / 3);
}
