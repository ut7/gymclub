class Fourmi
  attr_accessor :plateau, :ligne, :colonne, :direction

  DIRECTIONS = [
    { colonne_offset: -1, ligne_offset: 0 }, # gauche
    { colonne_offset:  0, ligne_offset: -1 }, # haut
    { colonne_offset:  1, ligne_offset:  0 }, # droite
    { colonne_offset:  0, ligne_offset:  1 }  # bas
  ].freeze

  def initialize(options)
    self.plateau = options[:plateau]
    self.ligne = options[:ligne] || plateau.centre[:ligne]
    self.colonne = options[:colonne] || plateau.centre[:colonne]
    self.direction = options[:direction] || 1
    @rules = options[:rules] || [-1, 1]
  end

  def avance
    couleur = plateau.case(ligne, colonne)
    nouvelle_couleur =
      plateau.colorie_case!(ligne, colonne, nouvelle_couleur(couleur))
    tourne(self.direction = nouvelle_direction(couleur))
    nouvelle_couleur
  end

  private

  def nouvelle_direction(couleur)
    (direction + @rules[couleur]) % 4
  end

  def nouvelle_couleur(couleur)
    (couleur + 1) % @rules.size
  end

  def tourne(direction)
    self.colonne = (colonne + DIRECTIONS[direction][:colonne_offset]) % plateau.colonnes
    self.ligne   = (ligne   + DIRECTIONS[direction][:ligne_offset])   % plateau.lignes
  end
end
