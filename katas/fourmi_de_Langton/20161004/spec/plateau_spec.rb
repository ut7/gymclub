require './plateau'
require './fourmi'
describe Plateau do
  it "met un objet positionnable dans sa position de depart" do
    plateau = Plateau.new(3,3)
    fourmi = Fourmi.new
    plateau.place(fourmi, 1,1)
    expect(plateau.contient(1,1)).to eq(fourmi)
  end

end
