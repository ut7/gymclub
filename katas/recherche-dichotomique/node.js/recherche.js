module.exports = function (item, liste) {
  var borneMin, borneMax, pivot;

  borneMin = 0
  borneMax = liste.length - 1;

  while (borneMax >= borneMin) {
    pivot = Math.floor((borneMax + borneMin) / 2);
    if (liste[pivot] === item ) { return pivot; }

    if (item < liste[pivot]) { borneMax = pivot - 1; }
    if (item > liste[pivot]) { borneMin = pivot + 1; }
  }

  return -1;
};
