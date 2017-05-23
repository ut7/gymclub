require './bataille'
require './joueur'
require './strategie_rangement'
bob = Joueur.new
alice = Joueur.new(strategie: StrategieDeRangementAscendant)
alice = Joueur.new
ARGV[0].to_i.times do
  jeu = ((7..10).to_a * 2).shuffle!
  bob.jeu = jeu.slice(0,jeu.size / 2)
  alice.jeu = jeu.slice(jeu.size / 2, jeu.size)
  puts "Jeu de Bob\n#{bob.jeu}"
  puts "Jeu de Alice\n#{alice.jeu}"
  gagnant = Bataille.new(bob, alice).joue
  puts "---- Gagnant : #{gagnant}"
end
puts "bob a gagné #{bob.parties_gagnees} parties"
puts "alice a gagné #{alice.parties_gagnees} parties"

