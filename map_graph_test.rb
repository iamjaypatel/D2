require 'minitest/autorun'
require_relative 'map_graph'

# Test for Class map, file.
class MapTest < Minitest::Test
  # UNIT TESTS FOR METHOD get_index_and_city_name(city) in MapGraph Class
  # Equivalence classes:
  # city = -INFINITY..-1 -> returns nil
  # city = 1..INFINITY -> returns nil
  # city = valid city name -> returns index of city in array (as integer)
  # city = invalid city name -> returns nil
  # city = 0 -> returns nil

  # Test numbers as an input
  # Test - Negative number
  def test_neg_number_as_city_name
    answer = MapGraph.new
    assert_nil answer.get_index_and_city_name(-1)
  end

  # Test - Zero
  def test_zero_number_as_city_name
    answer = MapGraph.new
    assert_nil answer.get_index_and_city_name(0)
  end

  # Test - Positive number
  def test_pos_number_as_city_name
    answer = MapGraph.new
    assert_nil answer.get_index_and_city_name(1)
  end

  # Test invalid city name
  def test_invalid_city_name
    answer = MapGraph.new
    assert_nil answer.get_index_and_city_name('Pittsburgh')
  end

  # Test valid city name, with index
  def test_valid_city_name
    answer = MapGraph.new
    assert_equal 6, answer.get_index_and_city_name('Dynamic Palisades')
  end
end
