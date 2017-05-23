class Joueur
  attr_accessor :jeu, :strategie
  attr_reader :parties_gagnees

  def initialize(options={})
    @jeu = options[:jeu] || []
    @strategie = options[:strategie]
    @parties_gagnees = 0
  end

  def avec_cartes?
    jeu.any?
  end

  def sans_carte?
    jeu.empty?
  end

  def gagne!
    @parties_gagnees += 1
  end
end
