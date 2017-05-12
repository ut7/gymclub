class Plateau
  attr_reader :lignes, :colonnes

  def initialize(lignes, colonnes)
    @lignes = lignes
    @colonnes = colonnes
    
    @cases = Array.new(lignes){Array.new(colonnes) {0}}
  end

  def case(ligne,colonne)
    @cases[ligne][colonne]
  end

  def colorie_case!(ligne,colonne, couleur)
    @cases[ligne][colonne] = couleur
  end

  def centre
    { ligne: lignes / 2, colonne: colonnes / 2 }
  end
end
