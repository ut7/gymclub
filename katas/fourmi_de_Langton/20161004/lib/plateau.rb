class Plateau
  attr_reader :lignes, :colonnes

  def initialize(lignes, colonnes)
    @lignes = lignes
    @colonnes = colonnes
    
    @cases = Array.new(lignes){Array.new(colonnes, Case.new(:blanc))}
  end

  def case(ligne,colonne)
    @cases[ligne][colonne]
  end

  def place(positionnable,ligne,colonne)
    @cases[ligne][colonne].objet = positionnable
  end
end

class Case
  attr_accessor :couleur, :objet

  def initialize(couleur)
    @couleur = couleur
  end
end
