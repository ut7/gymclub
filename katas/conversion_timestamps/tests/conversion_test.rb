require 'test/unit'
require './src/conversion'

class TestConversion < Test::Unit::TestCase
  def test_extraire_les_timestamps_en_secondes
    chaine = "01:30:01,114 --> 01:30:04,000"
    debut, fin = extrais_timestamps chaine
    assert_equal (1 * 3600 + 30 * 60 + 1.114), debut
    assert_equal (1 * 3600 + 30 * 60 + 4), fin
  end

  def test_convertir_secondes_en_timestamp
    secondes = [5401.114, 5404]
    assert_equal "01:30:01,114 --> 01:30:04,000", en_timestamps(secondes)
  end
end
