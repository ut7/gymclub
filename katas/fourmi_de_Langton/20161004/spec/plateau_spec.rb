require 'plateau'
require 'fourmi'
describe Plateau do
  it "contient initialement que des cases blanches" do
    plateau = Plateau.new(3,3)
    expect(plateau.case(1,1).couleur).to eq(:blanc)
    expect(plateau.case(2,2).couleur).to eq(:blanc)
  end

end
