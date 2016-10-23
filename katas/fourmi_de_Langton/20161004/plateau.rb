class Plateau
  attr_reader :lignes, :colonnes

  def initialize(lignes, colonnes)
    @lignes = lignes
    @colonnes = colonnes
    
    @cases = Array.new(lignes){Array.new(colonnes)}
  end

  def contient(ligne,colonne)
    @cases[ligne][colonne]
  end

  def place(positionnable,ligne,colonne)
    @cases[ligne][colonne] = positionnable
  end
end
