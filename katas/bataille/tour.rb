module Bataille
  class Tour
    attr_reader :main1, :main2

    def initialize(main1, main2)
      @main1 = main1
      @main2 = main2
    end

    def suivant!
      haut1 = main1.pop
      haut2 = main2.pop 

      if haut1 > haut2
        main1.unshift(haut1)
        main1.unshift(haut2)
      else
        main2.unshift(haut1)
        main2.unshift(haut2)
      end

    end
  end
end
