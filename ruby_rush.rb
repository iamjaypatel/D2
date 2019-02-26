# Jay Patel, CS 1632 D2
# Execute using ruby ruby_rush.rb
# with 3 arguments, the seed, number of prospectors,
# and the number of turns.

class CheckArguments
  def check_Arguments(args)
    args.count == 3 && args[0].to_i > 0 && args[1].to_i > 0 && args[2].to_i > 0
  rescue StandardError
    false
  end
end

# Program Starts HERE
arg = CheckArguments.new
good_arguments = arg.check_Arguments ARGV

if good_arguments
  seed = ARGV[0].to_i
  num_prospectors = ARGV[1].to_i
  num_turns = ARGV[2].to_i
else
  puts 'Usage: '
  puts 'ruby ruby_rush.rb *seed* *num_prospectors* *num_turns*'
  puts '*seed* should be an integer'
  puts '*num_prospectors* should be a non-negative integer'
  puts '*num_turns* should be a non-negative integer'
end
