var BOOK_PRICE = 8;
var REDUCS = [0, 0.05, 0.10, 0.20, 0.25];

function cost(k) {
  return k * BOOK_PRICE * (1 - (REDUCS[k - 1] || 0));
}

function hamming(int) {
  for (var k = 0; int; int &= int - 1) { k++; }
  return k;
}

module.exports = function sum(basket) {
  for (var tot = 0, i = 0; i < basket.length; i++) {
    if (~basket[i] && !(tot & (1 << basket[i]))) {
      tot ^= (1 << basket[i]);
      basket[i] = -1;
    }
  }
  return tot ? cost(hamming(tot)) + sum(basket) : 0;
};
