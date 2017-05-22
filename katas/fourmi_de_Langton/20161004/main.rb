require './lib/fourmi'
require './lib/plateau'
require './lib/vue_plateau_curses'

plateau = Plateau.new(80, 200)
vue_plateau = VuePlateauCurses.new
fourmi = Fourmi.new(plateau: plateau, rules: [1, -1, -1, 1])
puts plateau.centre

2500.times.each do
  vue_plateau.affiche(fourmi.avance, fourmi.ligne, fourmi.colonne)
  # sleep 0.1
end

sleep 120
vue_plateau.eteint
