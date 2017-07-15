require 'rover/version'
require 'rover/mission'
require 'rover/print_helpers'

module Rover
  class Rover
    include PrintHelpers

    def initialize(file, verbosity = false)
      @file = File.expand_path(file)
      @verbose = verbosity
    end

    def call
      mission = Mission.new(@file)
      mission.call
      @robots = mission.robots
      @plateau = mission.plateau
    end

    private

    def place_robot_on_position(position)
      until @robots.all?(&:finished)
        @robots.each do |robot|
          next if robot.finished
          robot.move!
        end
      end
    end

    def add_robot_to_solutions(final_position)
      @solution_report << final_position
    end
  end
end
