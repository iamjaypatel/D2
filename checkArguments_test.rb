# Check Arguments Test
require 'minitest/autorun'
require_relative 'ruby_rush'

# Classes to test checkArguments class
class checkArgumentsTest < Minitest::Test

  # Test that No Arguments fail
  def test_check_invalid_arguments
    args = CheckArguments.new
    assert_equal false, args.check_Arguments([])
  end

  # Test that atleast one argument fails
  def test_check_one_invalid_argument
    args = CheckArguments.new
    assert_equal false, args.checkArguments([1])
  end

  # Test that atleast one argument fails
  def test_check_two_invalid_argument
    args = CheckArguments.new
    assert_equal false, args.checkArguments([2])
  end

  # Test that fails if string is entered as an argument
  def test_check_string_agrument
    args = CheckArguments.new
    assert_equal false, args.checkArguments(['CHECKSTRING'])
  end
end
