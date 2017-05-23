require 'rspec'
require './strategie_rangement'

describe StrategieDeRangementAleatoire do
  it "melange aleatoirement un tableau" do
    tableau = [ 3, 5 , 7, 9 ]
    StrategieDeRangementAleatoire.ordonne!(tableau)
    expect(tableau.size).to eq(4)
  end
end

describe StrategieDeRangementAscendant do
  it "ordonne de manière ascendante un tableau" do
    tableau = [ 11, 2, 7, 5 ]
    StrategieDeRangementAscendant.ordonne!(tableau)
    expect(tableau).to eq([2,5,7,11])
  end
end
