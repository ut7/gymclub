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
    
    if (nb_lignes_demandees >= 3) {
      var ligne_precedente = pascal[pascal.length - 1];
      var ligne = [1,ligne_precedente[0]+ligne_precedente[1],1];
      pascal.push(ligne);
    }

    return pascal
  }
  
}

module.exports = Pascal