# encoding: utf-8

module Panier
  def self.montant_total(livres = [])
    livres.size * 8
  end
end
