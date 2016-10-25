require 'vue_plateau'
require 'plateau'
describe VuePlateau do
  it "affiche en position de départ" do
    plateau = Plateau.new(3,3)
    vue_plateau = VuePlateau.new(plateau)
    expect(vue_plateau.grille).to eq("| | | |\n| | | |\n| | | |\n")
  end

  it "affiche x dans une case noire" do
    plateau = Plateau.new(1,1)
    plateau.case(0,0).couleur = :noir
    vue_plateau = VuePlateau.new(plateau)
    expect(vue_plateau.grille).to eq("|x|\n")
  end
end
