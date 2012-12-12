exports.recherche = function (item, liste) {
  if (liste.length === 0) { return -1; }

  if (liste[0] === item ) { return 0; }

  return -1;
};
