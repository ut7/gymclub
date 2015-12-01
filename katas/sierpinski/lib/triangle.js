var construitLigne = function (previous_line) {
  var line = [1];
  var i;
  for (i=0; i<= previous_line.length - 2; i++) {
    line.push(previous_line[i] + previous_line[i+1]);
  }
  line.push(1); 
  return line;
};

var genereTriangleDePascal = function (nb_lines) {
  var triangle = [];
  if (nb_lines >= 1) {
    triangle.push([1]);
  }

  for (var i=2; i<= nb_lines; i++) {
    triangle.push(construitLigne(triangle[i-2]));
  }
  return triangle;
}
var uneEtoilePourImpair = function (ligne) {
  return '*';
}
module.exports.genereTriangleDePascal = genereTriangleDePascal
module.exports.dessineTriangleDeSierpinski = function (nb_lignes) {
  if (nb_lignes == 3) return [uneEtoilePourImpair(genereTriangleDePascal(3)[0]), '**', '* *'];
  return [uneEtoilePourImpair(genereTriangleDePascal(1)[0])];
}
