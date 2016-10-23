class VuePlateau
  def initialize(plateau)
    @plateau = plateau
  end

  def grille
    chaine_grille = ""
    @plateau.lignes.times do
      chaine_grille += "| " * @plateau.colonnes + "|\n"
    end
    chaine_grille
  end

  def affiche
    puts grille
  end

end
