require 'test_helper'
require 'rover/robot'

class RobotTest < Minitest::Test
  def setup
    instruction = ['1 2 N', 'LMLMLMLMM']
    @robot = Rover::Robot.new(instruction)
  end

  def test_that_given_an_instruction_it_builds_correctly
    assert_equal 1, @robot.column
    assert_equal 2, @robot.row
    assert_equal 'N', @robot.heading

    assert_equal %w[L M L M L M L M M], @robot.instance_eval { @movements }
  end

  def test_string_representation_is_like_position
    assert_equal "#{@robot}", @robot.position
  end
end
