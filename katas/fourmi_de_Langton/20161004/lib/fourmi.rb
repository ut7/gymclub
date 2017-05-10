class Fourmi
  attr_accessor :plateau, :ligne, :colonne, :direction

  DIRECTIONS = [
    { colonne_offset: -1, ligne_offset:  0 }, # gauche
    { colonne_offset:  0, ligne_offset: -1 }, # haut
    { colonne_offset:  1, ligne_offset:  0 }, # droite
    { colonne_offset:  0, ligne_offset:  1 }  # bas
  ]

  RULES = {
    blanc: { offset_direction: -1, :nouvelle_couleur => :noir },
    noir:  { offset_direction:  1, :nouvelle_couleur => :blanc }
  }

  def initialize(plateau, ligne, colonne)
    self.plateau = plateau
    self.ligne = ligne
    self.colonne = colonne
    self.direction = 1
  end

  def avance
    case_plateau = plateau.case(self.ligne, self.colonne)
    couleur = case_plateau.couleur
    tourne(self.direction = nouvelle_direction(couleur))
    case_plateau.couleur = nouvelle_couleur(couleur)
  end


  private

  def nouvelle_direction(couleur)
    (direction + RULES[couleur][:offset_direction]) % 4
  end

  def nouvelle_couleur(couleur)
    RULES[couleur][:nouvelle_couleur]
  end

  def tourne(direction)
    self.colonne = (self.colonne + DIRECTIONS[direction][:colonne_offset]) % plateau.colonnes
    self.ligne   = (self.ligne   + DIRECTIONS[direction][:ligne_offset])   % plateau.lignes
  end

end
