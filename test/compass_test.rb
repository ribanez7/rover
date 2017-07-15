require 'test_helper'
require 'rover/compass'

class CompassTest < Minitest::Test
  def test_that_it_points_the_right_coordinates_to_the_right
    compass = Rover::Compass.new('N', 'R')

    assert_equal 'E', compass.call

    compass.current = 'E'
    assert_equal 'S', compass.call

    compass.current = 'S'
    assert_equal 'W', compass.call

    compass.current = 'W'
    assert_equal 'N', compass.call
  end

  def test_that_it_points_the_right_coordinates_to_the_left
    compass = Rover::Compass.new('N', 'L')

    assert_equal 'W', compass.call

    compass.current = 'W'
    assert_equal 'S', compass.call

    compass.current = 'S'
    assert_equal 'E', compass.call

    compass.current = 'E'
    assert_equal 'N', compass.call
  end
end
