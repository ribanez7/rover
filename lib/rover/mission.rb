require 'rover/plateau'

module Rover
  class Mission

    def initialize(file)
      @file = file
    end

    def call
      coordinates, instructions = serialize_plat(@file)
      plateau = Plateau.new(coordinates)
      plateau.place_robots(instructions)
      [plateau, plateau.robots]
    end

    private

    def serialize_plat(file)
      raw_coordinates, raw_instructions = File.read(file).split("\n", 2)
      coordinates  = raw_coordinates.split
      instructions = build_instructions(raw_instructions)
      [coordinates, instructions]
    end

    def build_instructions(raw)
      raw_array = raw.split("\n")
      positions, maneuvers = raw_array.partition { |v| v.match? (/\W+/) }
      positions.zip(maneuvers)
    end
  end
end
