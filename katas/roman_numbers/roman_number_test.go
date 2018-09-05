package roman_number

import (
  "github.com/stretchr/testify/assert"
  "testing"
)

func TestCalculator_Numerals_can_be_concatenated_to_form_a_larger_numeral(t *testing.T) {
  assert.Equal(t, "II", CalculatorAdd("I", "I"))
  assert.Equal(t, "XXII", CalculatorAdd("XX", "II"))
}

func TestCalculator_numeral_is_I_X_or_C_you_cannot_have_more_than_three(t *testing.T) {
  assert.Equal(t, "IV", CalculatorAdd("II", "II"))
  assert.Equal(t, "V", CalculatorAdd("III", "II"))
  assert.Equal(t, "L", CalculatorAdd("XXX", "XX"))
  assert.Equal(t, "D", CalculatorAdd("CCC", "CC"))
}
