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
    rules = {
      blanc: { offset: -1, :nouvelle_couleur => :noir },
      noir:  { offset:  1, :nouvelle_couleur => :blanc }
    }
    couleur = case_plateau.couleur
    self.direction = nouvelle_direction(rules[couleur][:offset])
    send("tourne_#{direction}".to_sym)
    case_plateau.couleur = rules[couleur][:nouvelle_couleur]

  end


  def direction_index
    DIRECTIONS.find_index(self.direction) 
  end

  def nouvelle_direction(offset)
    DIRECTIONS[(direction_index + offset) % 4]
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
