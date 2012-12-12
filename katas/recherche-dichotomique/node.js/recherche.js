exports.recherche = function (item, liste) {
  var pivot;

  if (liste.length === 0) { return -1; }

  pivot = (liste.length - 1) / 2;
  if (liste[pivot] === item ) { return pivot; }

  pivot = pivot - 1;
  if (liste[pivot] === item ) { return pivot; }

  return -1;
};
