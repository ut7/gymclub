require 'rspec'
require './bataille'

RSpec.describe Bataille do
  it "renvoie le jeu gagnant" do
    bob = Joueur.new([10])
    alice = Joueur.new([9])
    expect(Bataille::result_war(bob, alice)).to eq(bob)
  end

  it "renvoie le jeu gagnant" do
    bob = Joueur.new([10])
    alice = Joueur.new([9])
    expect(Bataille::result_war(alice, bob)).to eq(bob)
  end
end
