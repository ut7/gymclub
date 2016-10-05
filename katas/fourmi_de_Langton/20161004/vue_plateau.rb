class VuePlateau
  def initialize(plateau)
    @plateau = plateau
  end

  def grille
    chaine_grille = ""
    @plateau.longueur.times do
      chaine_grille += "| " * @plateau.largeur + "|\n"
    end
    chaine_grille
  end

  def affiche
    puts grille
  end

end
