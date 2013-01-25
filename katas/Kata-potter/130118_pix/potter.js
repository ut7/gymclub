function sort(a) {
  return a.sort();
}

function lot(a) {
  var lots = [];
  while (!isMinus1(a)) {
    var max = -1;
    var q = [];
    for(var i = 0; i < a.length; i++) {
      if ( a[i] > max ) {
        q.push(a[i]);
        max = a[i];
        a[i] = -1;
      }
    }
    lots.push(q);
  }
  return lots;
}

function isMinus1(a) {
  for(var i = 0; i < a.length; i++) {
    if (a[i] !== -1) {
      return false;
    }
  }
  return true;
}


var random = [];
while (random.length < 20) {
  random.push(Math.floor(Math.random() * 5));
}

var books = random;
console.log(random);
console.log(lot(sort(books)));
