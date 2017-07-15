require 'test_helper'
require 'rover/mission'

class MissionTest < Minitest::Test
  def setup
    file = File.expand_path('example_mission')
    @mission = Rover::Mission.new(file)
  end

  def test_it_converts_a_file_into_a_mission
    return_array = @mission.call
    assert_instance_of Rover::Plateau, return_array.first
    assert_instance_of Rover::Robot, return_array.last.sample
  end
end
