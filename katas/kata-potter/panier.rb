# encoding: utf-8

module Panier
  PRIX_UNITAIRE = 8

  def self.montant_total(livres = [])
    if livres.uniq.size == 1
      livres.size * PRIX_UNITAIRE
    else
      PRIX_UNITAIRE * livres.size * 0.95
    end
  end

end
