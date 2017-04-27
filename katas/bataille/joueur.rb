class Joueur
  attr_reader :jeu
  def initialize(jeu)
    @jeu = jeu
  end

  def avec_cartes?
    jeu.any?
  end

  def sans_carte?
    jeu.empty?
  end
end
