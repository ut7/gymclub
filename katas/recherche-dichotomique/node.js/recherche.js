module.exports = function (item, liste) {
  var borneMax, pivot;

  borneMax = liste.length - 1;

  while (borneMax >= 0) {
    pivot = (borneMax) / 2;
    if (liste[pivot] === item ) { return pivot; }

    borneMax = pivot - 1;
  }

  return -1;
};
