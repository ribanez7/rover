module Rover
  class Compass
    def initialize(current, new_direction)
      @new_direction = new_direction
      @current = current
    end

    def call
      if @new_direction == 'L'
        turn_left
      else
        turn_right
      end
    end

    private

    def turn_left
      case @current
      when 'N' then 'W'
      when 'E' then 'N'
      when 'S' then 'E'
      when 'W' then 'S'
      end  
    end

    def turn_right 
      case @current
      when 'N' then 'E'
      when 'E' then 'S'
      when 'S' then 'W'
      when 'W' then 'N'
      end
    end
  end
end
