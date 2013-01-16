BOOK = 8

REDUCS = [
  0,
  0.5,
  0.10,
  0.20,
  0.25
]

# 1 <= k <= 5
cost = (k) ->
  BOOK * (1 - REDUCS[k])

orderer = (array) ->
  partitions = []

  for val in array
    partitions[val] ||= 0
    partitions[val]++

  partitions

totalCost = (part) ->
  empty = false
  result = []

  while not empty
    empty = true
    for val, i in [0..part.length - 1]
      k = 0
      if val and val > 0
        empty = false
        part[i]--
        k++
      result.push k

  total = 0
  for k in result
    total += cost k

  total

module.exports = (panier) ->
  totalCost orderer panier
