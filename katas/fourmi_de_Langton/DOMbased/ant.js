var grid = {

  size: 200,

  appendTo: function(el) {
    var html = '<table><tbody>';
    var line = '';
    for (var i = 0; i < this.size; i++) line += '<td/>';
    for (i = 0; i < this.size; i++) html += '<tr>' + line + '</tr>';
    el.innerHTML = html + '</tbody></table>';
    this.rows = el.firstChild.firstChild.childNodes;
    return this;
  },

  getCell: function(x, y) {
    return this.rows[x].childNodes[y];
  }
};

var ant = {

  dx: 0,
  dy: -1,

  putOn: function(grid) {
    this.grid = grid;
    this.y = grid.size / 2;
    this.x = grid.size / 2;
    this.cell = grid.getCell(this.x, this.y);
  },

  move: function() {
    this.cell.classList.remove('ant');
    this.x += this.dx;
    this.y += this.dy;
    this.cell = this.grid.getCell(this.x, this.y);
    this.cell.classList.add('ant');
    return this;
  },

  change: function() {
    var dy = this.dy;
    if (this.cell.classList.contains('on')) {
        this.dy = -this.dx;
        this.dx = dy;
    } else {
        this.dy = this.dx;
        this.dx = -dy;
    }
    this.cell.classList.toggle('on');
    return this;
  },

  run: function(grid) {
    this.putOn(grid);
    var ant = this;
    this.intervalId = setInterval(function() {
      try {
        ant.change().move();
      } catch (err) {
        ant.stop()
        throw err;
      }
    }, 0);
  },

  stop: function() {
    clearInterval(this.intervalId);
  }
};

ant.run(grid.appendTo(document.body));
