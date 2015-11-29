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
  var result = '';
  for (var i=0; i< ligne.length; i++) {
    result = (ligne[i] % 2 == 0) ? result + ' ' : result + '*';
  }
  return result;
}
module.exports.genereTriangleDePascal = genereTriangleDePascal
module.exports.dessineTriangleDeSierpinski = function (nb_lignes) {
  var result = [];
  var triangle = genereTriangleDePascal(nb_lignes);
  for (var i=0; i< nb_lignes; i++) {
    result.push(uneEtoilePourImpair(triangle[i]));
  }
  return result;
}
