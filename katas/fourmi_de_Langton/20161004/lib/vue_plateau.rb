class VuePlateau
  def initialize(plateau)
    @plateau = plateau
  end

  def grille
    chaine_grille = ""
    @plateau.lignes.times.each do |ligne|
      @plateau.colonnes.times.each do |colonne|
        chaine_grille += affiche_case(ligne,colonne)
      end
      chaine_grille += "|\n"
    end
    chaine_grille
  end

  def affiche_case(ligne, colonne)
    case_plateau = @plateau.case(ligne,colonne)
    correspondance = {:blanc => ' ', :noir => 'x'}
    "|#{correspondance[case_plateau.couleur]}"
  end

  def affiche
    puts grille
  end

end
