require 'test_helper'
require 'rover/plateau'

class PlateauTest < Minitest::Test
  def setup
    coordinates = [5, 5]
    @plateau = Rover::Plateau.new(coordinates)
  end

  def test_the_plateau_is_perfectly_drawn
    assert_equal 0, @plateau.starting_row
    assert_equal 5, @plateau.ending_row
    assert_equal 0, @plateau.starting_column
    assert_equal 5, @plateau.ending_column
  end

  def test_theres_no_place_for_more_than_one_robot_on_the_same_place
    instructions = []
    instructions << ['1 2 N', 'LMLMLMLMM']
    instructions << ['1 2 N', 'LMLMLMLMM']

    @plateau.place_robots(instructions)

    exception = assert_raises Rover::Plateau::GeographicalError do
                  @plateau.safe_position?(@plateau.robots.first)
                end

    assert_match(/place already occupied/ , exception.message)
  end

  def test_no_robot_will_fall
    instructions = []
    instructions << ['0 0 N', 'LMLMLMLMM']

    @plateau.place_robots(instructions)

    exception = assert_raises Rover::Plateau::GeographicalError do
                  @plateau.robots.first.move!
                end

    assert_match(/It will fall/ , exception.message)
  end
end
