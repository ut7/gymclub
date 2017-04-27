module Bataille
  class Tour
    attr_reader :joueur1, :joueur2, :levee

    def initialize(joueur1, joueur2)
      @joueur1 = joueur1
      @joueur2 = joueur2
      @levee = []
    end

    def suivant!
      gagnant = joueur_gagnant
      update_levee!
      if gagnant
        distribue_levee!(gagnant)
      end
    end

    private

    def joueur_gagnant
      hash = { jeu1.last => joueur1, jeu2.last => joueur2 }
      hash[ carte_gagnante(jeu1.last, jeu2.last) ]
    end

    def carte_gagnante(carte1, carte2)
      if carte1 > carte2
        carte1
      elsif carte1 < carte2
        carte2
      end
    end

    def jeu1
      joueur1.jeu
    end

    def jeu2
      joueur2.jeu
    end

    def update_levee!
      haut1 = jeu1.pop
      haut2 = jeu2.pop 
      levee.push(haut1, haut2)
    end

    def distribue_levee!(joueur)
      joueur.strategie.ordonne!(levee) if joueur.strategie
      joueur.jeu.unshift(levee)
      joueur.jeu.flatten!
      @levee = []
    end
  end
end
