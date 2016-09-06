module.exports = function remplit_sac_a_dos(items, volume) {

  var combinaisons = [];

  for(var j = 0; j <= volume; j++) {
      combinaisons[j] = []
      combinaisons[j][0] = 0;
  }
  for(var i = 1; i <= items.length; i++) {
      var item = items[i - 1];
      for (var j = 0; j <= volume; j++) {
	  if (item.volume <= volume) {
	      combinaisons[j][i] = Math.max(item.price, combinaisons[j][i - 1]);
	  }
      }
  }
  return combinaisons[volume][items.length];
}
