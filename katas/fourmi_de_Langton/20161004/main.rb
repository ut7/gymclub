require './lib/fourmi'
require './lib/plateau'
require './lib/vue_plateau_curses'

plateau = Plateau.new(80,80)
vue_plateau = VuePlateauCurses.new
fourmi = Fourmi.new(plateau, 40, 40)

500.times.each do
  vue_plateau.affiche(fourmi.avance, fourmi.ligne, fourmi.colonne)
  sleep 0.1
end

vue_plateau.eteint

