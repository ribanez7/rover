require 'rover/compass'

module Rover
  class Robot
    attr_reader :movements, :column, :row,
                :heading, :finished

    def initialize(instruction)
      position = instruction.first
      column, row, @heading = position.split
      @column = column.to_i
      @row = row.to_i
      @movements = instruction.last.scan(/\w/)
    end

    def to_s
      position
    end

    def location
      [column, row]
    end

    def location?(x, y)
      location == [x, y]
    end

    def position
      [location, heading].flatten.join(' ')
    end

    def move!
      if @movements.size.zero?
        @finished = true
      else
        maneuver = @movements.shift
        commit_maneuver(maneuver)
      end
    end

    private

    def commit_maneuver(maneuver)
      if maneuver.match? /L|R/
        rewrite_heading(maneuver)
      else
        move_forward
      end
    end

    def rewrite_heading(maneuver)
      @heading = Compass.new(heading, maneuver).call
    end

    def move_forward
      case heading
      when 'N'
        @row += 1
      when 'E'
        @column += 1
      when 'S'
        @row -= 1
      when 'W'
        @column -= 1
      else
        raise RuntimeError, "Unrecognized maneuver"
      end
    end
  end
end
