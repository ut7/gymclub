require 'plateau'
require 'fourmi'
describe Plateau do
  it "met un objet positionnable dans sa position de depart" do
    plateau = Plateau.new(3,3)
    fourmi = Fourmi.new
    plateau.place(fourmi, 1,1)
    expect(plateau.case(1,1).objet).to eq(fourmi)
    expect(fourmi.ligne).to eq(1)
    expect(fourmi.colonne).to eq(1)
  end

  it "contient initialement que des cases blanches" do
    plateau = Plateau.new(3,3)
    expect(plateau.case(1,1).couleur).to eq(:blanc)
    expect(plateau.case(2,2).couleur).to eq(:blanc)
  end

end
