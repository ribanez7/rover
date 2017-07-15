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
      @plateau, @robots = mission.call
      accomplish_mission
    end

    private

    def accomplish_mission
      until @robots.all?(&:finished)
        @robots.each do |robot|
          next if robot.finished
          robot.move!
        end
      end
      puts @plateau.display
    end
  end
end
