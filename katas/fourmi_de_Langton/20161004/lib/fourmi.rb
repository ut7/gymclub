class Fourmi
  attr_accessor :plateau, :ligne, :colonne, :direction
  DIRECTIONS = [:gauche, :haut, :droite, :bas]

  def initialize(plateau, ligne, colonne)
    @plateau = plateau
    self.ligne = ligne
    self.colonne = colonne
    @direction = :haut
  end

  def avance
    case_plateau = plateau.case(self.ligne, self.colonne)
    case_plateau.couleur == :blanc ? avance_depuis_case_blanche(case_plateau) : avance_depuis_case_noire(case_plateau)
  end

  def avance_depuis_case_blanche(case_plateau)
    self.direction = direction_case_blanche
    send("tourne_#{direction}".to_sym)
    case_plateau.couleur = :noir
  end

  def avance_depuis_case_noire(case_plateau)
    self.direction = direction_case_noire
    send("tourne_#{direction}".to_sym)
    case_plateau.couleur = :blanc
  end

  def direction_index
    DIRECTIONS.find_index(self.direction) 
  end

  def direction_case_noire
    DIRECTIONS[(direction_index + 1) % 4]
  end

  def direction_case_blanche
    DIRECTIONS[(direction_index - 1) % 4]
  end

  def tourne_droite
    self.colonne += 1
  end

  def tourne_bas
    self.ligne += 1
  end

  def tourne_gauche
    self.colonne -= 1
  end

  def tourne_haut
    self.ligne -= 1
  end
end
