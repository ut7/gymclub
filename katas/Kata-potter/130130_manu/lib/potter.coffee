_ = require "underscore"

ôte = (items, liste)-> 
  for item in items
    positionÀEnlever = _.indexOf liste, item
    liste.splice positionÀEnlever, 1
  liste
    
ôtePlusGrosLot = (achats)->
  plusGrosLot = _.uniq(achats)
  ôte(plusGrosLot, achats)

  plusGrosLot.length
    
construisLotsParTaille = (achats)->
  résultat = []
  résultat.push ôtePlusGrosLot achats while achats.length > 0

  optimise(résultat)

prix = (tailleLot)->
  [0, 8, 15.2, 21.6, 25.6, 30][tailleLot]

peutOptimiser = (lots)-> _.intersection(lots, [3, 5]).length == 2

optimise = (lots)->
  while peutOptimiser(lots)
    lots = ôte([3, 5], lots)
    lots.push 4
    lots.push 4
  lots


calculePrix = (achats)->
  achats = achats[..]
  lots = construisLotsParTaille achats
  prixLots = lots.map prix
  (prixLots).reduce ((x, y) -> x + y), 0

exports.calculePrix = calculePrix
exports.construisLotsParTaille = construisLotsParTaille

