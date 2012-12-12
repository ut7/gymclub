exports.recherche = function (item, liste) {
  var borneMax, pivot;

  if (liste.length === 0) { return -1; }

  borneMax = liste.length - 1;
  pivot = (borneMax) / 2;
  if (liste[pivot] === item ) { return pivot; }

  borneMax = pivot - 1;
  pivot = (borneMax) / 2;
  if (liste[pivot] === item ) { return pivot; }

  return -1;
};
