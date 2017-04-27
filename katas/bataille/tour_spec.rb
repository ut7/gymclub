require 'rspec'
require './bataille'

describe Bataille::Tour do
  it "initialise un tour avec 2 mains" do
    main1 = [ 3 , 11 ]
    main2 = [ 4, 5 ]
    expect(Bataille::Tour.new(main1, main2)).to be_truthy
  end


  it "reordonne les 2 mains avec la carte en haut de pile de la première main > à celle de la deuxième main" do
    main1 = [ 2, 3 , 11 ]
    main2 = [ 3, 4, 5 ]
    tour = Bataille::Tour.new(main1, main2)
    tour.suivant!
    expect(tour.main2.size).to eq(2)
    expect(tour.main2.last).to eq(4)
    expect(tour.main1.last).to eq(3)
    expect(tour.main1.slice(0,2).include?(5)).to be_truthy
    expect(tour.main1.slice(0,2).include?(11)).to be_truthy
  end

  it "reordonne les 2 mains avec les 2 cartes de haut de pile identiques" do
    main1 = [ 2, 3 , 11 ]
    main2 = [ 5, 6 , 11 ]
    tour = Bataille::Tour.new(main1, main2)
    tour.suivant!
    expect(tour.levee).to eq([11,11])
    expect(tour.main1).to eq([2,3])
    expect(tour.main2).to eq([5,6])
  end

  it "reordonne les 2 mains avec une levee" do
    main1 = [ 2, 3 , 11 ]
    main2 = [ 5, 6 , 11 ]
    tour = Bataille::Tour.new(main1, main2)
    tour.suivant!
    tour.suivant!
    expect(tour.main1.last).to eq(2)
    expect(tour.main2.last).to eq(5)
    expect(tour.main2.slice(0,4) - [ 3,6,11,11 ]).to eq([])
    expect([ 3,6,11,11 ] - tour.main2.slice(0,4) ).to eq([])
  end
end
