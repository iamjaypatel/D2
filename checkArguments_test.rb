# Check Arguments Test
require 'minitest/autorun'
require_relative 'ruby_rush'

# Classes to test checkArguments class
class checkArgumentsTest < Minitest::Test

  def test_check_one_invalid_arguments
    args = CheckArguments.new
    assert_equal false, args.check_Arguments([])
  end
