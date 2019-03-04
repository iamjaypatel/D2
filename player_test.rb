require 'minitest/autorun'
require_relative 'player'

# Test Class for player.rb
class PlayerTest < Minitest::Test
  # UNIT TESTS FOR METHOD run_prospector(num_prospector,search, num_turns) in Simulator Class
  # Equivalence classes:
  # num_prospector = -INFINITY..-1 -> returns nil
  # num_prospector = 1..INFINITY -> returns 1, snd tuns simulation as expected
  # going to 5 locations
  # num_prospector = (not a number) -> returns nil
  # num_prospector = 0 -> returns nil
  # search = Object of type Prospector -> returns 1
  # search = Object not of type Prospector -> returns nil
  # num_turns = Number of turns that the prospector has to make.

  # Test that negative value for num_prospector returns nil
  # EDGE CASE
  def test_run_neg_prospector
    answer = Player.new(1, 2, 3)
    answer.map_setup
    test_prospector = Minitest::Mock.new('Mock Prospector')
    def test_prospector.find(_param, _param2)
      1
    end

    def test_prospector.pick_next_city(_param, _param2)
      1
    end

    def test_prospector.no_of_location
      1
    end
    assert_nil answer.run_prospector(-1, test_prospector, 1)
  end

  # Test that string value for num_prospector returns nil
  def test_run_string_prospector
    answer = Player.new(1, 2, 3)
    answer.map_setup
    test_prospector = Minitest::Mock.new('Mock Prospector')
    def test_prospector.find(_param, _param2)
      1
    end

    def test_prospector.pick_next_city(_param, _param2, _param3)
      1
    end

    def test_prospector.no_of_location
      1
    end
    assert_nil answer.run_prospector('HI', test_prospector, 1)
  end

  # Test that a value of zero for num_prospector returns nil
  # EDGE CASE
  def test_run_zero_prospector
    answer = Player.new(1, 2, 3)
    answer.map_setup
    test_prospector = Minitest::Mock.new('Mock Prospector')
    def test_prospector.find(_param, _param2)
      1
    end

    def test_prospector.pick_next_city(_param, _param2, _param3)
      1
    end

    def test_prospector.no_of_location
      1
    end
    assert_nil answer.run_prospector(0, test_prospector, 1)
  end

  # Tests that non-negative int value for num_prospector returns a 5. Then
  # continues normal behavior and runs the simulation as expected.
  # The 5 represents a successful reach of 5 locations
  def test_run_prospector_passes
    answer = Player.new(1, 2, 5)
    answer.map_setup
    test_prospector = Minitest::Mock.new('Mock Prospector')
    def test_prospector.find(_param, _param2)
      1
    end

    def test_prospector.pick_next_city(_param, _param2)
      1
    end

    def test_prospector.no_of_location
      1
    end
    assert_equal 5, answer.run_prospector(4, test_prospector, 5)
  end

  # UNIT TESTS FOR METHOD map_setup() in Simulator Class
  # Equivalence classes:
  # Accepts no parameters, but it is expected to ALWAYS, return the 2D
  # Array displayed below.
  def test_map_setup
    map = [
      ['Enumerable Canyon', 'Duck Type Beach', 'Monkey Patch City'],
      ['Duck Type Beach', 'Matzburg', 'Enumerable Canyon'],
      ['Monkey Patch City', 'Nil Town', 'Matzburg', 'Enumerable Canyon'],
      ['Nil Town', 'Monkey Patch City'],
      ['Matzburg', 'Monkey Patch City', 'Duck Type Beach', 'Hash Crossing',
       'Dynamic Palisades'],
      ['Hash Crossing', 'Matzburg', 'Dynamic Palisades', 'Nil Town'],
      ['Dynamic Palisades', 'Matzburg', 'Hash Crossing']
    ]
    answer = Player.new(1, 2, 3)
    assert_equal map, answer.map_setup
  end
end
