require "test_helper"

class RoverTest < Minitest::Test
  def setup
    @file1 = 'example_mission'
    @file2 = 'example_provided'
  end

  def test_that_it_has_a_version_number
    refute_nil ::Rover::VERSION
  end

  def test_it_takes_a_file_and_commits_the_mission
    robotic_mission_1 = Rover::Rover.new(@file1)
    assert_output("3 1 W\n0 3 E\n") { robotic_mission_1.call }

    robotic_mission_2 = Rover::Rover.new(@file2)
    assert_output("1 3 N\n5 1 E\n") { robotic_mission_2.call }
  end
end
