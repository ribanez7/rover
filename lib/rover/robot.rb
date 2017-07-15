require 'rover/compass'

module Rover
  class Robot
    attr_reader :column, :row, :heading, :finished

    class RoboticError < StandardError
    end

    def initialize(instruction, plateau = nil)
      position = instruction.first
      column, row, @heading = position.split
      @column = column.to_i
      @row = row.to_i
      @movements = instruction.last.scan(/\w/)
      @plateau = plateau
    end

    def to_s
      position
    end

    def location
      [column, row]
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
        @plateau.safe_position?(self) if @plateau
        move!
      end
    end

    private

    def commit_maneuver(maneuver)
      if maneuver.match? (/L|R/)
        rewrite_heading(maneuver)
      else
        move_forward(maneuver)
      end
    end

    def rewrite_heading(maneuver)
      @heading = Compass.new(heading, maneuver).call
    end

    def move_forward(maneuver)
      raise RoboticError, <<~EOR if maneuver != 'M'
        "Unrecognized maneuver #{maneuver}"
      EOR
      case heading
      when 'N'
        @row += 1
      when 'E'
        @column += 1
      when 'S'
        @row -= 1
      when 'W'
        @column -= 1
      end
    end
  end
end
