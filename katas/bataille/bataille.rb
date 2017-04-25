module Bataille
  def self.result_war(main1, main2)
    return main2 if main1.empty?
    return main1 if main2.empty?
    
    haut1 = main1.pop
    haut2 = main2.pop 

    if haut1 > haut2
      main1.unshift(haut1)
      main1.unshift(haut2)
    else
      main2.unshift(haut1)
      main2.unshift(haut2)
    end
      
    result_war(main1,main2)
  end
end
