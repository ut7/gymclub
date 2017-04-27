class Joueur
  attr_accessor :jeu, :strategie
  def initialize(options={})
    @jeu = options[:jeu] || []
    @strategie = options[:strategie]
  end

  def avec_cartes?
    jeu.any?
  end

  def sans_carte?
    jeu.empty?
  end
end
