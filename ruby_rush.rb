# Jay Patel, CS 1632 D2
# Execute using ruby ruby_rush.rb
# with 3 arguments, the seed, number of prospectors,
# and the number of turns.
require_relative 'check_argument'
require_relative 'player'

# Program Starts HERE
arg = CheckArguments.new
good_arguments = arg.check_arguments ARGV

if good_arguments
  seed = ARGV[0].to_i
  num_prospectors = ARGV[1].to_i
  num_turns = ARGV[2].to_i
  @player = Player.new(seed,num_prospectors, num_turns)
  @player.explore
else
  puts 'Usage: '
  puts 'ruby ruby_rush.rb *seed* *num_prospectors* *num_turns*'
  puts '*seed* should be an integer'
  puts '*num_prospectors* should be a non-negative integer'
  puts '*num_turns* should be a non-negative integer'
end
