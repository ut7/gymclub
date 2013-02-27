var num = 100;
var line = '';
var grid = $('tbody');
for (var i = 0; i < num; i++) { line += '<td></td>'; }
var els = ''
for (var i = 0; i < num; i++) {
    els += '<tr>' + line + '</tr>';
}
grid.html(els)
/*
   dx is the delta x : first
   dy is the delta y
*/
var cache ={};
var ant = {x: num / 2, y: num / 2, dx: 0, dy: -1};
function findCell(x, y) {
    var pos = num * y + x
    if (!cache[pos]) {
      cache[pos] = $("td:eq("+pos+")") 
    }
    return cache[pos];
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

    position.toggleClass('on')
    position.removeClass('ant');
    ant.x += ant.dx;
    ant.y += ant.dy;
    position = findCell(ant.x, ant.y);
    position.addClass('ant');
}

setInterval(moveAnt, 1);
