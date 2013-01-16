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

sum = (buckets) ->
  buckets.reduce (prev, current) ->
    prev + cost(current)
  , 0

buckets = (partitions) ->
  bucks = []
  loop
    k = 0
    for numbers, val in partitions when numbers > 0
      k++
      partitions[val]--
    break if k is 0
    bucks.push k
  bucks

orderer = (basket) ->
  partitions = [1..BOOKS].map -> 0
  partitions[val]++ for val in basket
  partitions

module.exports = (basket) ->
  sum buckets orderer basket
