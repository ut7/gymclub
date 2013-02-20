var monnaye = function (montant, montantMaxPiece) {
  var result = [];

  if (montant === 0) return [[0, 0, 0, 0]];

  function oteUnePiece(valeurPiece, position) {
    if (valeurPiece > montantMaxPiece) return result;
    if (montant >= valeurPiece) {
      var combinaisons = monnaye(montant - valeurPiece, valeurPiece);
      combinaisons.forEach(function(combinaison) {
        combinaison[position] += 1;
        result.push(combinaison);
      });
    }
  }

  var pieces = [21, 11, 7, 1];

  for (var i = 0; i < pieces.length; i ++) {
    oteUnePiece(pieces[i], i);
  }

  return result;
};

module.exports = monnaye;
