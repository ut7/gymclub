module.exports = (panier) ->
  prix = panier.length * 8
  reduction = if panier.length <= 1
    1
  else if 1 < panier.length < 3 and panier[0] isnt panier[1]
    0.95
  else
    1

  prix * reduction
