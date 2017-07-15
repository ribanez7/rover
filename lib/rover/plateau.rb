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

    def place_robot(robot)
      @robots << robot
    end

    def safe_position?(loc)
      robots.none? { |r| r.location == loc }
    end
  end
end
