require 'fourmi'
require 'plateau'

describe Fourmi do
  let(:plateau) { Plateau.new(3,3) }
  let(:fourmi) { Fourmi.new(plateau: plateau, ligne: 1, colonne: 1 ) }

  it "se pose sur plateau" do
    expect(fourmi.ligne).to eq(1)
    expect(fourmi.colonne).to eq(1)
  end

  it "avance depuis une case blanche regardant vers le haut" do
    plateau.colorie_case!(1,1, 0)
    fourmi.direction = 1

    fourmi.avance
    expect(fourmi.ligne).to eq(1)
    expect(fourmi.colonne).to eq(0)
    expect(plateau.case(1,1)).to eq(1)
    expect(plateau.case(1,2)).to eq(0)
  end

  it "avance depuis une case blanche regardant vers la droite" do
    plateau.colorie_case!(1,1, 0)
    fourmi.direction = 2

    fourmi.avance
    expect(fourmi.ligne).to eq(0)
    expect(fourmi.colonne).to eq(1)
    expect(plateau.case(1,1)).to eq(1)
    expect(plateau.case(0,1)).to eq(0)
  end

  it "avance depuis une case noire regardant vers le haut" do
    plateau.colorie_case!(1, 1, 1)
    fourmi.direction = 1

    fourmi.avance
    expect(fourmi.ligne).to eq(1)
    expect(fourmi.colonne).to eq(2)
    expect(plateau.case(1,1)).to eq(0)

  end

  it "avance depuis les bords du plateau sans crasher" do
    plateau.colorie_case!(2, 2, 1)
    fourmi = Fourmi.new(plateau: plateau, ligne: 2, colonne: 2)
    fourmi.direction = 1

    fourmi.avance
    expect(fourmi.ligne).to eq(2)
    expect(fourmi.colonne).to eq(0)
  end
end
