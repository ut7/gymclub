var reducs = [
  1,
  0.95,
  0.90,
  0.80,
  0.75
];

function sort(a) {
  return a.sort();
}

function lots(a) {
  var lots = [];
  while (!isMinus1(a)) {
    var max = -1;
    var q = [];
    for (var i = 0; i < a.length; i++) {
      if (a[i] > max) {
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
  for (var i = 0; i < a.length; i++) {
    if (a[i] !== -1) {
      return false;
    }
  }
  return true;
}

function price(results) {
  var price = 0;
  for (var i = 0; i < results.length; i++) {
    var element = results[i];
    var reduc = reducs[element.length - 1];
    price += (8 * element.length * reduc);
  }
  return price;
}

function hasThreeAndFive(results) {
  var indexes = [[], []];
  for (var i = 0; i < results.length; i++) {
     if (results[i].length === 3)
         indexes[0].push(i);
     if (results[i].length === 5)
         indexes[1].push(i);
  }
  return indexes;
}

var random = [];
while (random.length < 20) {
  random.push(Math.floor(Math.random() * 5));
}

var books = random;
console.log(random);
var results = lots(sort(books));
console.log(results);
threeAndFiveIndexes = hasThreeAndFive(results);

var price = price(results);
console.log(price);
