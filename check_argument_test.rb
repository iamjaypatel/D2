# Check Arguments Test
require 'minitest/autorun'

require_relative 'check_argument'

# Classes to test checkArguments class
class CheckArgumentsTest < Minitest::Test
  # Test that No Arguments fail
  def test_check_invalid_arguments
    answer = CheckArguments.new
    assert_equal false, answer.check_arguments([])
  end

  # Test that atleast one argument fails
  def test_check_one_invalid_argument
    answer = CheckArguments.new
    assert_equal false, answer.check_arguments([1])
  end

  # Test that atleast one argument fails
  def test_check_two_invalid_argument
    answer = CheckArguments.new
    assert_equal false, answer.check_arguments([2])
  end

  # Test that fails if string is entered as an argument
  def test_check_string_agrument
    answer = CheckArguments.new
    assert_equal false, answer.check_arguments(['CHECK'])
  end

  # Test that two string fails as an argument
  # EDGE CASE
  def test_check_string_two_argument
    answer = CheckArguments.new
    assert_equal false, answer.check_arguments(%w[CHECK STRING])
  end

  # Test that two string argument fails
  # EDGE CASE
  def test_check_string_three_argument
    answer = CheckArguments.new
    assert_equal false, answer.check_arguments(['CHECK', 5, 3])
  end

  # Test that negative integer fails
  def test_check_negative_integer_argument
    answer = CheckArguments.new
    assert_equal false, answer.check_arguments([-3, 1, 2])
  end

  # Test if zero fails as an argument
  def test_check_zero_argument
    answer = CheckArguments.new
    assert_equal false, answer.check_arguments([0, 1, 2])
  end

  # Test for valid argument
  def test_check_valid_arguments
    answer = CheckArguments.new
    assert_equal true, answer.check_arguments([6, 2, 5])
  end
end
