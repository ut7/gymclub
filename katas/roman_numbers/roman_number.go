package roman_number

import (
  "strings"
)

func reduce(presult *string, smaller string, bigger string) {
  *presult = strings.Replace(*presult, strings.Repeat(smaller,5), bigger, 1)
  *presult = strings.Replace(*presult, strings.Repeat(smaller,4), smaller+bigger, 1)
}

func CalculatorAdd(v1, v2 string) string {
  result := v1 + v2
  reduce(&result, "I", "V")
  reduce(&result, "X", "L")
  reduce(&result, "C", "D")
  return result
}
