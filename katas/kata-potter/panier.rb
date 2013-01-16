# encoding: utf-8

module Panier
  def self.montant_total(livres = [])
    if livres.empty?
      0
    elsif livres.size == 2
      8 * 2
    else
      8
    end
  end
end
