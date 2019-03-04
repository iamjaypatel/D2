require 'minitest/autorun'
require_relative 'prospector'

# Test for Class map, file.
class ProspectorTest < Minitest::Test
  # UNIT TESTS FOR METHOD gen_rand_number(seed, range) in Prospector Class
  # Equivalence classes:
  # seed = -INFINITY..-1 -> returns nil
  # seed = 1..INFINITY -> returns pseudorandom number, that will always be the
  # same for the same seed
  # seed = (not a number) -> returns nil
  # seed = 0 -> returns nil

  # Test that negative numbers returns nil. This is also based on requirement 1
  # in that all seeds must be a non-negative positive integer.
  # EDGE CASE
  def test_gen_rand_num_negative
    seed = -1
    range = 7
    test_map = Minitest::Mock.new('Mock Map')
    test_map_graph = Minitest::Mock.new('Mock Map')
    search = Prospector.new(test_map, test_map_graph)
    assert_nil search.gen_rand_num(seed, range)
  end

  # Test that non-integer input returns nil. This is also based on requirement 1
  # in that all seeds must be a non-negative positive integer.
  # EDGE CASE
  def test_gen_rand_num_string
    seed = 'Hello!'
    range = 2
    test_map = Minitest::Mock.new('Mock Map')
    test_map_graph = Minitest::Mock.new('Mock Map')
    search = Prospector.new(test_map, test_map_graph)
    assert_nil search.gen_rand_num(seed, range)
  end

  # Test that zero returns nil. This is also based on requirement 1
  # in that all seeds must be a non-negative positive integer.
  # EDGE CASE
  def test_gen_rand_num_zero
    seed = 0
    range = 3
    test_map = Minitest::Mock.new('Mock Map')
    test_map_graph = Minitest::Mock.new('Mock Map')
    search = Prospector.new(test_map, test_map_graph)
    assert_nil search.gen_rand_num(seed, range)
  end

  # Test that nonnegative integer seed returns a random number.
  # This is also based on requirement 1
  # in that all seeds must be a non-negative positive integer.
  # should return the same random number when run multiple times with
  # The same seed.
  def test_gen_rand_num_passed
    seed = 1
    range = 8
    test_map = Minitest::Mock.new('Mock Map')
    test_map_graph = Minitest::Mock.new('Mock Map')
    search = Prospector.new(test_map, test_map_graph)
    first_run = search.gen_rand_num(seed, range)
    assert_equal first_run, search.gen_rand_num(seed, range)
  end

  # UNIT TESTS FOR METHOD no_of_location() in Prospector Class
  # Equivalence classes:
  # SHOLD ALWAYS RETURN 1. This method keeps a count of prospector
  # location visits. Will Always return 1 no matter what.

  # Test to confirm 1 is returned when called
  def test_no_of_location
    test_map = Minitest::Mock.new('Mock Map')
    test_map_graph = Minitest::Mock.new('Mock Map')
    search = Prospector.new(test_map, test_map_graph)
    assert_equal 1, search.no_of_location
  end

  # Test to confirm that 1 is returned everytime to achieve a count
  def test_no_of_location_repeat
    count = 0
    test_map = Minitest::Mock.new('Mock Map')
    test_map_graph = Minitest::Mock.new('Mock Map')
    search = Prospector.new(test_map, test_map_graph)
    80.times { count += search.no_of_location }
    assert_equal 80, count
  end

  # UNIT TESTS FOR METHOD find(start,city) in Prospector Class
  # Equivalence classes:
  # start = -INFINITY..-1 -> returns nil
  # start = 1..INFINITY -> returns 1, and searching goes as expected
  # start = 0 -> returns 1, and searching goes as expected
  # city = -INFINITY..-1 -> returns nil
  # city = 1..INFINITY -> returns 1, and searching goes as expected
  # city = 0 -> returns 1, and searching goes as expected

  # Tests that negative itetation returns nil
  # EDGE CASE
  def test_negative_start_search
    test_map = Minitest::Mock.new('Mock Map')
    test_map_graph = Minitest::Mock.new('Mock Map')
    search = Prospector.new(test_map, test_map_graph)
    assert_nil search.find(-1, 1)
  end

  # Tests that 0 itetation returns 1
  # EDGE CASE
  def test_zero_start_search
    test_map = Minitest::Mock.new('Mock Map')
    test_map_graph = Minitest::Mock.new('Mock Map')
    search = Prospector.new(test_map, test_map_graph)
    assert_equal 1, search.find(0, 1)
  end

  # Tests that valid start input < 4 returns 1
  def test_start_search_passes_less_than_four
    test_map = Minitest::Mock.new('Mock Map')
    test_map_graph = Minitest::Mock.new('Mock Map')
    search = Prospector.new(test_map, test_map_graph)
    assert_equal 1, search.find(2, 1)
  end

  # Tests that valid input = 4 returns 1
  # EDGE CASE
  def test_start_search_passes_equal_four
    test_map = Minitest::Mock.new('Mock Map')
    test_map_graph = Minitest::Mock.new('Mock Map')
    search = Prospector.new(test_map, test_map_graph)
    assert_equal 1, search.find(4, 1)
  end

  # Tests that valid start input = 4 returns 1
  # EDGE CASE
  def test_start_search_passes_greater_than_four
    test_map = Minitest::Mock.new('Mock Map')
    test_map_graph = Minitest::Mock.new('Mock Map')
    search = Prospector.new(test_map, test_map_graph)
    assert_equal 1, search.find(5, 1)
  end

  # Tests that negative city value returns nil
  # EDGE CASE
  def test_negative_city_search
    test_map = Minitest::Mock.new('Mock Map')
    test_map_graph = Minitest::Mock.new('Mock Map')
    search = Prospector.new(test_map, test_map_graph)
    assert_nil search.find(1, -1)
  end

  # Tests that 0 city value returns 1
  # EDGE CASE
  def test_zero_city_search
    test_map = Minitest::Mock.new('Mock Map')
    test_map_graph = Minitest::Mock.new('Mock Map')
    search = Prospector.new(test_map, test_map_graph)
    assert_equal 1, search.find(1, 0)
  end

  # Tests that 7 city value returns nil
  # EDGE CASE
  def test_seven_city_search
    test_map = Minitest::Mock.new('Mock Map')
    test_map_graph = Minitest::Mock.new('Mock Map')
    search = Prospector.new(test_map, test_map_graph)
    assert_nil search.find(1, 7)
  end

  # Tests that valid city value returns 1
  def test_passes_city_search
    test_map = Minitest::Mock.new('Mock Map')
    test_map_graph = Minitest::Mock.new('Mock Map')
    search = Prospector.new(test_map, test_map_graph)
    assert_equal 1, search.find(1, 4)
  end

  # UNIT TESTS FOR METHOD pick_next_city(current_city,seed,prospector) in Prospector Class
  # Equivalence classes:
  # current_city = -INFINITY..-1 -> returns nil
  # current_city = 0..6 -> returns next city location
  # current_city = 7..INFINITY -> returns nil
  # seed = -INFINITY..-1 -> returns nil
  # seed = 1..INFINITY -> returns next city location
  # seed = 0 -> returns nil

  # Test negative input for current_city
  # EDGE CASE
  def test_next_location_negative_city
    test_map = Minitest::Mock.new('Mock Map')
    test_map_graph = Minitest::Mock.new('Mock Map')
    search = Prospector.new(test_map, test_map_graph)
    def test_map_graph.get_index_and_city_name(_param)
      nil
    end
    assert_nil search.pick_next_city(-1, 1)
  end

  # Test invalid input = 7 for current_city
  # EDGE CASE
  def test_next_location_invalid_city_seven
    test_map = Minitest::Mock.new('Mock Map')
    test_map_graph = Minitest::Mock.new('Mock Map')
    search = Prospector.new(test_map, test_map_graph)
    def test_map_graph.get_index_and_city_name(_param)
      nil
    end
    assert_nil search.pick_next_city(7, 1)
  end

  # Test invalid input > 7 for current_city
  def test_next_location_invalid_city
    test_map = Minitest::Mock.new('Mock Map')
    test_map_graph = Minitest::Mock.new('Mock Map')
    search = Prospector.new(test_map, test_map_graph)
    def test_map_graph.get_index_and_city_name(_param)
      nil
    end
    assert_nil search.pick_next_city(10, 1)
  end

  # Test valid input for current_city
  def test_next_location_valid_city
    test_map = Minitest::Mock.new('Mock Map')
    test_map_graph = Minitest::Mock.new('Mock Map')
    search = Prospector.new(test_map, test_map_graph)
    def test_map_graph.get_index_and_city_name(_param)
      3
    end
    assert_includes [0, 1, 2, 3, 4, 5, 6], search.pick_next_city(1, 1)
  end

  # Test negative input for seed
  # EDGE CASE
  def test_next_location_negative_seed
    test_map = Minitest::Mock.new('Mock Map')
    test_map_graph = Minitest::Mock.new('Mock Map')
    search = Prospector.new(test_map, test_map_graph)
    def test_map_graph.get_index_and_city_name(_param)
      nil
    end
    assert_nil search.pick_next_city(1, -2)
  end

  # Test invalid input = 0 for seed
  # EDGE CASE
  def test_next_location_invalid_seed_zero
    test_map = Minitest::Mock.new('Mock Map')
    test_map_graph = Minitest::Mock.new('Mock Map')
    search = Prospector.new(test_map, test_map_graph)
    def test_map_graph.get_index_and_city_name(_param)
      nil
    end
    assert_nil search.pick_next_city(1, 0)
  end

  # Test valid input for seed
  def test_next_location_valid_seed
    test_map = Minitest::Mock.new('Mock Map')
    test_map_graph = Minitest::Mock.new('Mock Map')
    search = Prospector.new(test_map, test_map_graph)
    def test_map_graph.get_index_and_city_name(_param)
      3
    end
    assert_includes [0, 1, 2, 3, 4, 5, 6], search.pick_next_city(1, 2)
  end

  # UNIT TESTS FOR METHOD setup_table in Prospector Class
  # Equivalence classes:
  # Should ALWAYS return 2D Array [[0,2],[0,3],[0,4],[0,5],[3,3],[5,0],[10,0]]

  def test_setup_table
    test_map = Minitest::Mock.new('Mock Map')
    test_map_graph = Minitest::Mock.new('Mock Map')
    search = Prospector.new(test_map, test_map_graph)
    assert_equal [[1, 1], [2, 2], [1, 1], [0, 3], [3, 0], [2, 2], [2, 2]], search.setup_table
  end

  # UNIT TESTS FOR METHOD print_end(prospector) in Prospector Class
  # Equivalence classes:
  # prospector = -INFINITY..-1 -> returns nil
  # prospector = 0 -> returns nil
  # prospector = (Not a number)) -> returns nil
  # prospector = 0..INFINITY  -> returns results in form of string

  # Tests negative input for prospector
  def test_print_end_negative
    test_map = Minitest::Mock.new('Mock Map')
    test_map_graph = Minitest::Mock.new('Mock Map')
    search = Prospector.new(test_map, test_map_graph)
    assert_nil search.print_end(-4)
  end

  # Tests zero input for prospector
  # EDGE CASE
  def test_print_end_zero
    test_map = Minitest::Mock.new('Mock Map')
    test_map_graph = Minitest::Mock.new('Mock Map')
    search = Prospector.new(test_map, test_map_graph)
    assert_nil search.print_end(0)
  end

  # Tests string input for prospector
  def test_print_end_string
    test_map = Minitest::Mock.new('Mock Map')
    test_map_graph = Minitest::Mock.new('Mock Map')
    search = Prospector.new(test_map, test_map_graph)
    assert_nil search.print_end('Pittsburgh')
  end

  # Tests valid input for prospector
  def test_print_end_valid
    test_map = Minitest::Mock.new('Mock Map')
    test_map_graph = Minitest::Mock.new('Mock Map')
    search = Prospector.new(test_map, test_map_graph)
    assert_equal 1, search.print_end(2)
  end

  # Tests valid input for prospector formats output correctly
  def test_print_end_valid_output
    test_map = Minitest::Mock.new('Mock Map')
    test_map_graph = Minitest::Mock.new('Mock Map')
    search = Prospector.new(test_map, test_map_graph)
    out_put = "After 0 days Rubyist #4 found:\n"
    out_put += "      0 rubies\n      0 fake rubies\nGoing home empty-handed.\n\n\n"
    assert_output(out_put) { search.print_end(4) }
  end

  # Tests valid input for prospector formats output correctly
  def test_print_end_valid_output1
    test_map = Minitest::Mock.new('Mock Map')
    test_map_graph = Minitest::Mock.new('Mock Map')
    search = Prospector.new(test_map, test_map_graph)
    out_put = "After 1 days Rubyist #4 found:\n"
    out_put += "      10 rubies\n      0 fake rubies\nGoing home victorious.\n\n\n"
    assert_output(nil) { search.print_end(4) }
  end

  # Tests valid input for prospector formats output correctly
  def test_print_end_valid_output2
    test_map = Minitest::Mock.new('Mock Map')
    test_map_graph = Minitest::Mock.new('Mock Map')
    search = Prospector.new(test_map, test_map_graph)
    out_put = "After 0 days Rubyist #4 found:\n"
    out_put += "      5 rubies\n      0 fake rubies\nGoing home sad.\n\n\n"
    assert_output(nil) { search.print_end(4) }
  end
end
