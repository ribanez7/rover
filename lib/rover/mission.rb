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
      positions, maneuvers = raw_array.partition { |v| v.match? /\W+/ }
      instructions = positions.zip(maneuvers)
    end
  end
end

# puts "rows: #{plateau.rows}"
# puts "starting_row: #{plateau.starting_row}"
# puts "ending_row: #{plateau.ending_row}"
# puts "columns: #{plateau.columns}"
# puts "starting_column: #{plateau.starting_column}"
# puts "ending_column: #{plateau.ending_column}"
