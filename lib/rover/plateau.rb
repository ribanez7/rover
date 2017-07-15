require 'rover/robot'

module Rover
  class Plateau
    attr_accessor :robots

    def initialize(coordinates)
      @size_x = coordinates.first.to_i
      @size_y = coordinates.last.to_i
      @robots = []
    end

    def rows
      @size_y
    end

    def starting_row
      0
    end

    def ending_row
      rows - 1
    end

    def columns
      @size_x
    end

    def starting_column
      0
    end

    def ending_column
      columns - 1
    end

    def column_range
      starting_column..ending_column
    end

    def row_range
      starting_row..ending_row
    end

    def place_robots(instructions)
      instructions.each do |instruction|
        @robots << Robot.new(instruction)
      end
    end

    def safe_position?(loc)
      safe_regarding_comrades?(loc)
      safe_inside_plateau?(loc)
    end

    def display
      final_positions = robots.map(&:position).join("\n")
    end

    private

    def safe_regarding_comrades?(loc)
      unless robots.none? { |r| r.location == loc }
        raise RuntimeError, <<~EOF
          A rover is trying to access a place already occupied.
        EOF
      end
    end

    def safe_inside_plateau?(loc)
      unless column_range.include?(loc.first) && row_range.include?(loc.last)
        raise RuntimeError, <<~EOF
          A rover is trying to access a place out of the plateau. It will fall.
        EOF
      end
    end
  end
end
