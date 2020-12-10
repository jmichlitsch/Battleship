require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class CellTest < Minitest::Test
  def setup
    @cell = Cell.new("B4")
  end
  def test_cell_exists
    assert_instance_of Cell, @cell
  end

  def test_it_has_coordinate
    assert_equal @cell.coordinate, "B4"
  end

  def test_is_ship_on_cell_by_default
    assert_nil @cell.ship
    assert_equal true, @cell.empty?
  end

  def test_ship_can_be_placed
    cruiser = Ship.new("Cruiser",3)
    @cell.place_ship(cruiser)
    assert_equal @cell.ship, cruiser
  end



end
