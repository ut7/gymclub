exports.recherche = function (item, liste) {
  var borneMax, pivot;

  borneMax = liste.length - 1;
  pivot = (borneMax) / 2;

  while (borneMax >= 0) {
    if (liste[pivot] === item ) { return pivot; }

    borneMax = pivot - 1;
    pivot = (borneMax) / 2;
  }

  return -1;
};
