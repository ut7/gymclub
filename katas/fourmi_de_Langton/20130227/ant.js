var num = 50;
var line = '';
var grid = $('tbody');
for (var i = 0; i < num; i++) { line += '<td></td>'; }
for (var i = 0; i < num; i++) {
    grid.append('<tr>' + line + '</tr>');
}
/*
   dx is the delta x : first
   dy is the delta y
   */
var ant = {x: num / 2, y: num / 2, dx: 0, dy: -1};
var cache = {};

function findCell(x, y) {
    return grid.find('tr:nth-child(' + x + ') td:nth-child(' + y + ')');
}

var position;
function moveAnt() {
    position = findCell(ant.x, ant.y);

    var dy = ant.dy;
    if (position.hasClass('on')) {
        ant.dy = -ant.dx;
        ant.dx = dy;
    } else {
        ant.dy = ant.dx;
        ant.dx = -dy;
    }

    position.toggleClass('on').removeClass('ant');
    ant.x += ant.dx;
    ant.y += ant.dy;
    position = findCell(ant.x, ant.y);
    position.addClass('ant');
}

setInterval(moveAnt, 0);
