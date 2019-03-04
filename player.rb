require_relative 'prospector'
require_relative 'map_graph'

# This class file runs the program
class Player
  # Initialize
  def initialize(seed, num_prospector, num_turns)
    @seed = seed
    @num_prospector = num_prospector
    @num_turns = num_turns
  end

  # Start Exploring
  def explore
    map_setup
    explore_counter = 1
    while explore_counter <= @num_prospector
      search = Prospector.new(@map, MapGraph.new)
      run_prospector(explore_counter, search, @num_turns)
      search.print_end(explore_counter)
      explore_counter += 1
    end
  end

  # Set up map, with cities and path(branches)
  def map_setup
    @map = [
      ['Enumerable Canyon', 'Duck Type Beach', 'Monkey Patch City'],
      ['Duck Type Beach', 'Matzburg', 'Enumerable Canyon'],
      ['Monkey Patch City', 'Nil Town', 'Matzburg', 'Enumerable Canyon'],
      ['Nil Town', 'Monkey Patch City', 'Hash Crossing'],
      ['Matzburg', 'Monkey Patch City', 'Duck Type Beach', 'Hash Crossing',
       'Dynamic Palisades'],
      ['Hash Crossing', 'Matzburg', 'Dynamic Palisades', 'Nil Town'],
      ['Dynamic Palisades', 'Matzburg', 'Hash Crossing']
    ]
  end

  # Run Prospector
  def run_prospector(num_prospector, search, num_turns)
    num_prospector = num_prospector.to_i
    no_turn = num_turns.to_i
    result = nil
    run_prospector_counter = 0
    y = 0
    puts "\nRubyist ##{num_prospector} starting in #{@map[y][0]}"
    while run_prospector_counter < no_turn && num_prospector > 0
      search.find(run_prospector_counter, y)
      run_prospector_counter += search.no_of_location
      y = search.pick_next_city(y, @seed) unless
        run_prospector_counter > no_turn
      result = run_prospector_counter
    end
    result
  end
end
