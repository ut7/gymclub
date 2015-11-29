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
  return ligne.map(function(elem) {
    return (elem % 2 == 0) ? ' ' : '*';
  }).join(separator);
}

var ajouter_espaces = function(ligne_string, nb_lignes) {
  var rang_ligne = (ligne_string.length + 1) / 2;
  var spaces_to_add = nb_lignes - rang_ligne;
  var spaces = '';
  for (var i=0; i< spaces_to_add; i++) {
    spaces += ' ';
  }
  return spaces + ligne_string;
}
module.exports.genereTriangleDePascal = genereTriangleDePascal
module.exports.dessineTriangleDeSierpinski = function (nb_lignes, centre) {
  result = genereTriangleDePascal(nb_lignes).map(function(ligne) {
    var separator = centre ? '.' : '';
    return uneEtoilePourImpair(ligne, separator);
  });
  if (! centre) return result;

  return result.map(function(ligne) {
    return ajouter_espaces(ligne, nb_lignes);
  });
}
