module Rover
  module PrintHelpers
    def verbose(message)
      return unless @verbose
      puts message
    end
  end
end
