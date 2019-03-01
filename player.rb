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

  end

  # Set up map, with cities and path
  def map_setup
    @map = [
    ]
  end

  # Run Prospector
  def run_prospector

  end
end
