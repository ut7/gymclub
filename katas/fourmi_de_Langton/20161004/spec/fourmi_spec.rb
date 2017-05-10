require 'fourmi'
require 'plateau'

describe Fourmi do

  it "se pose sur plateau" do
    plateau = Plateau.new(3,3)
    fourmi = Fourmi.new(plateau, 1,1)
    expect(fourmi.ligne).to eq(1)
    expect(fourmi.colonne).to eq(1)
  end

  it "avance depuis une case blanche regardant vers le haut" do
    plateau = Plateau.new(3,3)
    plateau.case(1,1).couleur = :blanc
    fourmi = Fourmi.new(plateau, 1, 1)
    fourmi.direction = 1

    fourmi.avance
    expect(fourmi.ligne).to eq(1)
    expect(fourmi.colonne).to eq(0)
    expect(plateau.case(1,1).couleur).to eq(:noir)
    expect(plateau.case(1,2).couleur).to eq(:blanc)
  end

  it "avance depuis une case blanche regardant vers la droite" do
    plateau = Plateau.new(3,3)
    plateau.case(1,1).couleur = :blanc
    fourmi = Fourmi.new(plateau, 1,1)
    fourmi.direction = 2

    fourmi.avance
    expect(fourmi.ligne).to eq(0)
    expect(fourmi.colonne).to eq(1)
    expect(plateau.case(1,1).couleur).to eq(:noir)
    expect(plateau.case(0,1).couleur).to eq(:blanc)
  end

  it "avance depuis une case noire regardant vers le haut" do
    plateau = Plateau.new(3,3)
    plateau.case(1,1).couleur = :noir
    fourmi = Fourmi.new(plateau, 1, 1)
    fourmi.direction = 1

    fourmi.avance
    expect(fourmi.ligne).to eq(1)
    expect(fourmi.colonne).to eq(2)
    expect(plateau.case(1,1).couleur).to eq(:blanc)

  end

  it "avance depuis les bords du plateau sans crasher" do
    plateau = Plateau.new(3,3)
    plateau.case(2,2).couleur = :noir
    fourmi = Fourmi.new(plateau, 2, 2)
    fourmi.direction = 1

    fourmi.avance
    expect(fourmi.ligne).to eq(2)
    expect(fourmi.colonne).to eq(0)
  end
end
