var COINS = [
  { name: 'or',     value: 21 },
  { name: 'argent', value: 11 },
  { name: 'bronze', value: 7 },
  { name: 'cuivre', value: 1 }
];

// sort coins by value...
COINS = COINS.sort(function(a, b) {
  return b.value - a.value;
});

function money(amount, coins) {
  var stack = [];
  coins.forEach(function(coin, i) {
    var diff = amount - coin.value;
    if (diff > 0) {
      var res = money(diff, coins.slice(i));
      res.forEach(function(r) { r.unshift(coin); })
      stack.push.apply(stack, res);
    } else if (diff === 0) {
      stack.push([coin]);
    }
  });
  return stack;
}
