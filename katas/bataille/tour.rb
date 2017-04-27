module Bataille
  class Tour
    attr_reader :main1, :main2, :levee

    def initialize(main1, main2)
      @main1 = main1
      @main2 = main2
      @levee = []
    end

    def suivant!
      gagnant = main_gagnante
      update_levee!
      distribue_levee!(gagnant) if gagnant
    end

    private

    def main_gagnante
      if main1.last > main2.last
        main1
      elsif main1.last < main2.last
        main2
      end
    end

    def update_levee!
      haut1 = main1.pop
      haut2 = main2.pop 
      levee.push(haut1, haut2)
    end

    def distribue_levee!(main)
      main.unshift(levee.pop) while levee.any?
    end
  end
end
