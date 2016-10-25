require './lib/fourmi'
require './lib/plateau'
require './lib/vue_plateau'

plateau = Plateau.new(80,80)
vue_plateau = VuePlateau.new(plateau)
fourmi = Fourmi.new
plateau.place(fourmi, 40,40)

2000.times.each do |tour|
  fourmi.avance(plateau)
  vue_plateau.affiche
end

