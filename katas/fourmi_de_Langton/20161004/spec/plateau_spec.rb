require 'plateau'
describe Plateau do
  it "contient initialement que des cases blanches" do
    plateau = Plateau.new(3,3)
    expect(plateau.case(1,1)).to eq(0)
    expect(plateau.case(2,2)).to eq(0)
  end

end
