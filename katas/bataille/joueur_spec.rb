require 'rspec'
require './joueur'

describe Joueur do
  it "renvoie true si le joueur a des cartes dans son jeu" do
    bob = Joueur.new([2,3,4])
    expect(bob.avec_cartes?).to be_truthy
  end

  it "renvoie true si le joueur n'a pas de carte dans son jeu" do
    bob = Joueur.new([])
    expect(bob.sans_carte?).to be_truthy
  end
end

