require 'rspec'
require './joueur'

describe Joueur do
  it "renvoie jeu" do
    bob = Joueur.new([2,3,4])
    expect(bob.jeu).to be_truthy
  end

  it "renvoie strategie" do
    strategie = double("strategie_aleatoire", ordonne!: true)
    bob = Joueur.new([2,3,4], strategie)
    expect(bob.strategie).to eq(strategie)
  end 

  it "renvoie true si le joueur a des cartes dans son jeu" do
    bob = Joueur.new([2,3,4])
    expect(bob.avec_cartes?).to be_truthy

    bob = Joueur.new([])
    expect(bob.avec_cartes?).to be_falsy
  end

  it "renvoie true si le joueur n'a pas de carte dans son jeu" do
    bob = Joueur.new([])
    expect(bob.sans_carte?).to be_truthy
    bob = Joueur.new([2,3,4])
    expect(bob.sans_carte?).to be_falsy
  end
end

