var Pascal = {
  triangle: function(nb_lignes_demandees) {
    var pascal=[]
    if (nb_lignes_demandees >= 1) {
      var ligne = [1];
      pascal.push(ligne);
    }
    if (nb_lignes_demandees >= 2) {
      var ligne = [1,1];
      pascal.push(ligne);
    }
    return pascal
  }
}

module.exports = Pascal