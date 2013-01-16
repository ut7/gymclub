# encoding: utf-8

module Panier
  PRIX_UNITAIRE = 8

  def self.montant_total(livres = [])
    livres.size * PRIX_UNITAIRE
  end
end
