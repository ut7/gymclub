class Plateau
  attr_reader :longueur, :largeur

  def initialize(lignes, colonnes)
    @largeur = lignes
    @longueur = colonnes
    
    @cases = Array.new(lignes){Array.new(colonnes)}
  end

  def contient(ligne,colonne)
    @cases[ligne][colonne]
  end

  def place(positionnable,ligne,colonne)
    @cases[ligne][colonne] = positionnable
  end
end
