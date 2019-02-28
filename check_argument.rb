# This file is for Argument, that are passed in command line
# class for Arguments
class CheckArguments
  def check_arguments(args)
    args.count == 3 && args[0].to_i > 0 && args[1].to_i > 0 && args[2].to_i > 0
  rescue StandardError
    false
  end
end
