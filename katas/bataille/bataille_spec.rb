require 'rspec'
require './bataille'

RSpec.describe Bataille do
  it "renvoie le jeu gagnant" do
    jeu1 = [10]
    jeu2 = [9]
    expect(Bataille::result_war(jeu1, jeu2)).to eq(jeu1)
  end

  it "renvoie le jeu avec la carte la plus élevée" do
    main1 = [9]
    main2 = [11]
    expect(Bataille::result_war(main1, main2)).to eq(main2)
  end
  it "renvoie le jeu gagnant" do
    main1 = [  3, 11]
    main2 = [ 5, 9]
    expect(Bataille::result_war(main1, main2)).to eq(main1)
  end
end
