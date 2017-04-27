require 'rspec'
require './bataille'

describe Bataille::Tour do
  it "initialise un tour avec 2 joueurs" do
    bob = double("bob", jeu: [2,3,11])
    alice = double("alice", jeu: [3,4,5])
    expect(Bataille::Tour.new(bob, alice)).to be_truthy
  end


  it "reordonne les 2 mains avec la carte en haut de pile de la première main > à celle de la deuxième main" do
    bob = Joueur.new([2,3,11])
    alice = Joueur.new([3,4,5])
    tour = Bataille::Tour.new(bob, alice)
    tour.suivant!
    expect(alice.jeu.size).to eq(2)
    expect(alice.jeu.last).to eq(4)
    expect(bob.jeu.last).to eq(3)
    expect(bob.jeu.slice(0,2).include?(5)).to be_truthy
    expect(bob.jeu.slice(0,2).include?(11)).to be_truthy
  end

  it "reordonne les 2 mains avec les 2 cartes de haut de pile identiques" do
    bob = Joueur.new([2,3,11])
    alice = Joueur.new([5,6,11])
    tour = Bataille::Tour.new(bob, alice)
    tour.suivant!
    expect(tour.levee).to eq([11,11])
    expect(bob.jeu).to eq([2,3])
    expect(alice.jeu).to eq([5,6])
  end

  it "reordonne les 2 mains avec une levee" do
    bob = Joueur.new [ 2, 3 , 11 ]
    alice = Joueur.new [ 5, 6 , 11 ]
    tour = Bataille::Tour.new(bob, alice)
    tour.suivant!
    tour.suivant!
    expect(bob.jeu.last).to eq(2)
    expect(alice.jeu.last).to eq(5)
    expect(alice.jeu.slice(0,4) - [ 3,6,11,11 ]).to eq([])
    expect([ 3,6,11,11 ] - alice.jeu.slice(0,4) ).to eq([])
  end
end
