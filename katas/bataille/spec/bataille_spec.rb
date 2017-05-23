require 'rspec'
require './bataille'

RSpec.describe Bataille do
  it "renvoie le jeu gagnant" do
    bob = Joueur.new(jeu: [10])
    alice = Joueur.new(jeu: [9])
    bataille = Bataille.new(bob, alice)
    gagnant = bataille.joue
    expect(gagnant).to eq(bob)
  end
end
