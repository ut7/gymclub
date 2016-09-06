var assert = require('assert');
var remplit_sac_a_dos = require('../main');

describe("sac_a_dos", function(){
  it("empty bag when no items to pick", function(){
    assert.deepEqual(remplit_sac_a_dos([], 5), 0);
  });

  it("Item qui peut aller dans le sac, y va", function(){
    assert.deepEqual(remplit_sac_a_dos([{'price' : 1, 'volume' : 5}], 5), 1);
  });

  it("Si volume item > Volume du sac => On prend pas", function(){
    assert.deepEqual(remplit_sac_a_dos([{'price' : 1, 'volume' : 5}], 3), 0);
  });

  it("2 items A et B au même prix, A rentre dans le sac, B ne rentre pas car sac plein", function(){
    assert.deepEqual(remplit_sac_a_dos([{'price' : 1, 'volume' : 5}, {'price' : 1, 'volume':2}], 5), 1);
  });

  it("2 items A et B à des prix différents => Plus grand prix doit être choisi", function(){
    assert.deepEqual(remplit_sac_a_dos([{'price' : 1, 'volume' : 5}, {'price' : 3, 'volume':2}], 5), 3);
  });

  it("2 items A et B à des prix différents => Plus grand prix doit être choisi 2", function(){
    assert.deepEqual(remplit_sac_a_dos([{'price' : 5, 'volume' : 5}, {'price' : 3, 'volume':2}], 5), 5);
  });

  it("je peux prendre plusieurs items", function(){
    assert.deepEqual(remplit_sac_a_dos([{'price' : 5, 'volume' : 5}, {'price' : 3, 'volume':2}], 10), 8);
  });

  xit("Meilleure combinaison", function(){
    assert.deepEqual(remplit_sac_a_dos(
      [
        {'price' : 5, 'volume' : 5},
        {'price' : 3, 'volume' : 2},
        {'price' : 3, 'volume' : 2}
      ], 5), 6);
  });
})
