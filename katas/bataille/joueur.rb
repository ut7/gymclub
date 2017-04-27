class Joueur
  attr_reader :jeu, :strategie
  def initialize(jeu, strategie=nil)
    @jeu = jeu
    @strategie = strategie
  end

  def avec_cartes?
    jeu.any?
  end

  def sans_carte?
    jeu.empty?
  end
end
