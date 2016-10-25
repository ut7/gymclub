require 'fourmi'
require 'plateau'

describe Fourmi do
  context "sur une case blanche" do
    plateau = Plateau.new(3,3)
    plateau.case(1,1).couleur = :blanc
    
    it "tourne sur la droite et avance" do
      plateau.place(subject, 1,1)
      subject.avance(plateau)
      expect(subject.ligne).to eq(1)
      expect(subject.colonne).to eq(2)
      expect(plateau.case(1,1).couleur).to eq(:noir)
      expect(plateau.case(1,2).couleur).to eq(:blanc)
    end
  end
end
