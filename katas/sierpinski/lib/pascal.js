var construitLigne = function(ligne_precedente) {
  var ligne = [1];
  index = 0;
  
  ligne.push(ligne_precedente[index] + ligne_precedente[index+1]);
  if (index < ligne_precedente.length-2) {
    index = index+1;
    ligne.push(ligne_precedente[index] + ligne_precedente[index+1]);
  }
  
  ligne.push(1);
  return ligne;
}

var triangle = function(nb_lignes_demandees) {
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
    var ligne = construitLigne(ligne_precedente)
    pascal.push(ligne);
  }
  
  if (nb_lignes_demandees >= 4) {
    var ligne_precedente = pascal[pascal.length - 1];
    var ligne = construitLigne(ligne_precedente);
    pascal.push(ligne);
  }

  return pascal
} 

module.exports.triangle = triangle