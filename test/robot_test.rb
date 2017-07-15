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

  def test_moves_to_north
    instruction = ['1 2 N', 'M']
    robot = Rover::Robot.new(instruction)
    robot.move!

    assert_equal 3, robot.row
    assert_equal '1 3 N', robot.position
  end

  def test_moves_to_east
    instruction = ['1 2 E', 'M']
    robot = Rover::Robot.new(instruction)
    robot.move!

    assert_equal 2, robot.column
    assert_equal '2 2 E', robot.position
  end

  def test_moves_to_south
    instruction = ['1 2 S', 'M']
    robot = Rover::Robot.new(instruction)
    robot.move!

    assert_equal 1, robot.row
    assert_equal '1 1 S', robot.position
  end

  def test_moves_to_west
    instruction = ['1 2 W', 'M']
    robot = Rover::Robot.new(instruction)
    robot.move!

    assert_equal 2, robot.row
    assert_equal '0 2 W', robot.position
  end

  def test_it_raises_error_with_bad_instructions
    instruction = ['1 2 N', 'LLLN']
    robot = Rover::Robot.new(instruction)

    assert_raises(Rover::Robot::RoboticError) do
      robot.move!
    end
  end
end
