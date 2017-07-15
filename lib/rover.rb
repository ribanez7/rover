require 'rover/version'
require 'rover/mission'

module Rover
  class Rover
    def initialize(file)
      @file = File.expand_path(file)
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
