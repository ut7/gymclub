# encoding: utf-8

module Panier
  PRIX_UNITAIRE = 8
  DISCOUNTS = [1, 0.95, 0.9, 0.8]

  def self.montant_total(livres = [])
    return 0 if livres.empty?

    if livres.uniq.size == 1
      livres.size * PRIX_UNITAIRE
    else
      PRIX_UNITAIRE * livres.size * DISCOUNTS[livres.size - 1]
    end
  end

end
