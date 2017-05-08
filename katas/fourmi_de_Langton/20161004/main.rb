require './lib/fourmi'
require './lib/plateau'
require './lib/vue_plateau'

plateau = Plateau.new(80,80)
vue_plateau = VuePlateau.new(plateau)
fourmi = Fourmi.new(plateau, 40, 40)

100.times.each do |tour|
  fourmi.avance
  vue_plateau.affiche
end

