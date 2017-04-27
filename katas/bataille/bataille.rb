require './tour'
module Bataille
  def self.result_war(joueur1, joueur2)
    
    tour = Tour.new(joueur1, joueur2)
    while (joueur1.avec_cartes? && joueur2.avec_cartes?) do
      tour.suivant!
    end

    if joueur1.sans_carte?
      joueur2
    else
      joueur1
    end
      
  end

end
