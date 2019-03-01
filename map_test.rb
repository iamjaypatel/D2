require 'minitest/autorun'
require_relative 'map'

# Test for Class map, file.
class MapTest < Minitest::Test
  # Test numbers as an input
  # Test - Negative number
  def test_neg_number_as_city_name
    answer = Map.new
    assert_nil answer.get_index_and_city_name(-1)
  end

  # Test - Zero
  def test_zero_number_as_city_name
    answer = Map.new
    assert_nil answer.get_index_and_city_name(0)
  end

  # Test - Positive number
  def test_pos_number_as_city_name
    answer = Map.new
    assert_nil answer.get_index_and_city_name(1)
  end

  # Test invalid city name
  def test_city_name
      answer = Map.new
      assert_nil answer.get_index_and_city_name('Pittsburgh')
  end

  # Test valid city name, with index
  def test_city_name
      answer = Map.new
      assert_equal 6, answer.get_index_and_city_name('Dynamic Palisades')
  end
end
