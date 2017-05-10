class Fourmi
  attr_accessor :plateau, :ligne, :colonne, :direction

  DIRECTIONS = [
    { colonne_offset: -1, ligne_offset:  0 }, # gauche
    { colonne_offset:  0, ligne_offset: -1 }, # haut
    { colonne_offset:  1, ligne_offset:  0 }, # droite
    { colonne_offset:  0, ligne_offset:  1 }  # bas
  ]

  RULES = [ -1, 1 ]

  def initialize(plateau, ligne, colonne)
    self.plateau = plateau
    self.ligne = ligne
    self.colonne = colonne
    self.direction = 1
  end

  def avance
    couleur = plateau.case(self.ligne, self.colonne)
    plateau.colorie_case!(self.ligne, self.colonne, nouvelle_couleur(couleur))
    tourne(self.direction = nouvelle_direction(couleur))
  end


  private

  def nouvelle_direction(couleur)
    (direction + RULES[couleur]) % 4
  end

  def nouvelle_couleur(couleur)
    ( couleur + 1 ) % RULES.size
  end

  def tourne(direction)
    self.colonne = (self.colonne + DIRECTIONS[direction][:colonne_offset]) % plateau.colonnes
    self.ligne   = (self.ligne   + DIRECTIONS[direction][:ligne_offset])   % plateau.lignes
  end

end
