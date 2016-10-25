require 'fourmi'
require 'plateau'

describe Fourmi do

  it "avance depuis une case blanche regardant vers le haut" do
    plateau = Plateau.new(3,3)
    plateau.case(1,1).couleur = :blanc
    fourmi = Fourmi.new
    fourmi.direction = :haut

    plateau.place(fourmi, 1,1)
    fourmi.avance(plateau)
    expect(fourmi.ligne).to eq(1)
    expect(fourmi.colonne).to eq(2)
    expect(plateau.case(1,1).couleur).to eq(:noir)
    expect(plateau.case(1,2).couleur).to eq(:blanc)
  end

  it "avance depuis une case blanche regardant vers la droite" do
    plateau = Plateau.new(3,3)
    plateau.case(1,1).couleur = :blanc
    fourmi = Fourmi.new
    fourmi.direction = :droite

    plateau.place(fourmi, 1,1)
    fourmi.avance(plateau)
    expect(fourmi.ligne).to eq(2)
    expect(fourmi.colonne).to eq(1)
    expect(plateau.case(1,1).couleur).to eq(:noir)
    expect(plateau.case(2,1).couleur).to eq(:blanc)
  end
end
