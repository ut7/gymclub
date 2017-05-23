require 'rspec'
require './bataille'

describe Tour do
  it "initialise un tour avec 2 joueurs" do
    bob = double("bob", jeu: [2,3,11])
    alice = double("alice", jeu: [3,4,5])
    expect(Tour.new(bob, alice)).to be_truthy
  end


  it "reordonne les 2 mains avec la carte en haut de pile de la première main > à celle de la deuxième main" do
    bob = Joueur.new(jeu: [2,3,11])
    alice = Joueur.new(jeu: [3,4,5])
    tour = Tour.new(bob, alice)
    tour.suivant!
    expect(alice.jeu.size).to eq(2)
    expect(alice.jeu.last).to eq(4)
    expect(bob.jeu.last).to eq(3)
    expect(bob.jeu.slice(0,2).include?(5)).to be_truthy
    expect(bob.jeu.slice(0,2).include?(11)).to be_truthy
  end

  it "reordonne les 2 mains avec les 2 cartes de haut de pile identiques" do
    bob = Joueur.new(jeu: [2,3,11])
    alice = Joueur.new(jeu: [5,6,11])
    tour = Tour.new(bob, alice)
    tour.suivant!
    tour.suivant!
    expect(bob.jeu).to eq([])
    expect(alice.jeu.sort).to eq([2,5,3,6,11,11].sort)
  end
end
