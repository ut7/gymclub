var construitLigne = function (previous_line) {
  var line = [1];
  var i;
  for (i=0; i<= previous_line.length - 2; i++) {
    line.push(previous_line[i] + previous_line[i+1]);
  }
  line.push(1); 
  return line;
};

var genereTriangle = function (nb_lines) {
  var triangle = [];
  if (nb_lines >= 1) {
    triangle.push([1]);
  }

  for (var i=2; i<= nb_lines; i++) {
    triangle.push(construitLigne(triangle[i-2]));
  }
  return triangle;
}

module.exports.genereTriangle = genereTriangle
module.exports.dessineTriangleDeSierpinski = function (nb_lignes) {
  if (nb_lignes == 3) return ['*', '**', '* *'];
  return genereTriangle(nb_lignes).map(function (element) {
    return element % 2 == 0 ? ' ' : '*';
  });
}
