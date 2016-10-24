require 'vue_plateau'
require 'plateau'
describe VuePlateau do
  it "affiche en position de départ" do
    plateau = Plateau.new(3,3)
    vue_plateau = VuePlateau.new(plateau)
    expect(vue_plateau.grille).to eq("| | | |\n| | | |\n| | | |\n")
  end
end
