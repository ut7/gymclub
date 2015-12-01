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
var uneEtoilePourImpair = function (ligne, separator) {
  if (separator === undefined) separator = '';
  return ligne.map(function (elem) {
    return (elem % 2 == 0) ? ' ' : '*';
  }).join(separator);
}

var uneEtoilePourImpairIsocele = function (ligne, index, nb_lignes) {
  return genereEspaces(nb_lignes - 1 - index) + uneEtoilePourImpair(ligne, '.'); 
}

var genereEspaces = function (nb_espaces) {
  var spaces_to_add = '';
  for (var i=0; i < nb_espaces; i++) spaces_to_add += ' ';
  return spaces_to_add;
};

module.exports.genereTriangleDePascal = genereTriangleDePascal
module.exports.dessineTriangleDeSierpinski = function (nb_lignes, center) {
  return genereTriangleDePascal(nb_lignes).map(function (ligne, index) {
    if (center) {
      return uneEtoilePourImpairIsocele(ligne, index, nb_lignes);
    }
    return uneEtoilePourImpair(ligne);
  });
}
