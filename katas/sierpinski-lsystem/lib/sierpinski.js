var transformA = function () {
  return 'B-A-B';
}

var transformB = function () {
  return 'A+B+A';
}

var convert = function (sequence) {
  return sequence.split('').map(function (character) {
    switch(character) {
      case 'A':
        return transformA();
        break;
      case 'B':
        return transformB();
        break;
      default:
        return character;
    }
  }).join('');
}

var genereCourbeSierpinski = function (depth) {
  if (depth === 0) return 'A';
  return convert(genereCourbeSierpinski(depth - 1));
}

module.exports.genereCourbeSierpinski = genereCourbeSierpinski;
