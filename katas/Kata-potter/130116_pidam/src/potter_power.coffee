BOOK_PRICE = 8
REDUCS = [0, 0.05, 0.10, 0.20, 0.25]

cost = (k) ->
  k * BOOK_PRICE * (1 - (REDUCS[k - 1] || 0))

sum = (basket) ->
  tot = 0
  max = -1
  for val, i in basket when val > max
    max = val
    tot++
    basket[i] = -1
  if tot then cost(tot) + sum(basket) else 0

module.exports = (basket) ->
  sum basket.sort()
