BOOK = 8

REDUCS = [
  0,
  0.05,
  0.10,
  0.20,
  0.25
]

# 1 <= k <= 5
cost = (k) ->
  k * BOOK * (1 - REDUCS[k])

orderer = (array) ->
  partitions = [0, 0, 0, 0, 0]
  for val in array
    partitions[val]++
  partitions

totalCost = (partitions) ->
  result = []
  empty  = false

  while not empty
    empty = true
    k = 0
    for val, i in partitions
      if val and val > 0
        empty = false
        partitions[i]--
        k++
    result.push k

  result.reduce (prev, current) ->
    prev + cost(current)
  , 0

module.exports = (panier) ->
  totalCost orderer panier
