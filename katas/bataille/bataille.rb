require './tour'
module Bataille
  def self.result_war(main1, main2)
    
    tour = Tour.new(main1, main2)
    while (tour.main1.any? && tour.main2.any?) do
      tour.suivant!
    end

    if tour.main1.empty?
      main2
    else
      main1
    end
      
  end

end
