BOOK_PRICE = 8
BOOKS  = 5
REDUCS = [
  0,
  0.05,
  0.10,
  0.20,
  0.25
]

# 0 <= k <= BOOKS
cost = (k) ->
  return 0 if k is 0
  k * BOOK_PRICE * (1 - REDUCS[k - 1])

orderer = (panier) ->
  partitions = [1..BOOKS].map -> 0
  partitions[val]++ for val in panier
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
