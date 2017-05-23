require './tour'
require './joueur'
require './strategie_rangement'

class Bataille

  attr_reader :winner

  def initialize(joueur1, joueur2)
    @joueur1 = joueur1
    @joueur2 = joueur2
    @historique = []
  end
   
  def joue
    tour = Tour.new(joueur1, joueur2)
    while !fin do
      historique << [ joueur1.jeu, joueur2.jeu ]
      tour.suivant!
    end
    @winner
  end

  def fin
    if bataille_infinie?
      return true
    end

    if joueur1.avec_cartes? && joueur2.sans_carte?
      joueur1.gagne!
      @winner = joueur1
    elsif joueur2.avec_cartes? && joueur1.sans_carte?
      joueur2.gagne!
      @winner = joueur2
    else
      false
    end
  end

  def bataille_infinie?
    return false if @historique.size < 4
    historique.take(@historique.size - 2).find(false){|tour| tour[0] == joueur1.jeu && tour[1] == joueur2.jeu }
  end

  private
  attr_reader :joueur1, :joueur2, :historique
end
