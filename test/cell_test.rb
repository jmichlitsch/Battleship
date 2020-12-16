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

  def test_is_board_empty?
    cruiser = Ship.new("Cruiser",3)
    @cell.place_ship(cruiser)
    assert_equal @cell.empty?, false
  end

  def test_ship_been_fired_upon_by_default
    cruiser = Ship.new("Cruiser",3)
    @cell.place_ship(cruiser)
    assert_equal @cell.fired_upon?, false
  end

  def test_ship_fired_upon_taking_hit
    cruiser = Ship.new("Cruiser",3)
    @cell.place_ship(cruiser)
    @cell.fired_upon
    assert_equal true, @cell.fired_upon?
  end

  def test_ship_takes_damage
    cruiser = Ship.new("Cruiser",3)
    @cell.place_ship(cruiser)
    @cell.fired_upon
    assert_equal @cell.ship.health , 2
  end

  def test_cell_renders_blank

    assert_equal @cell.render, "."
  end

  def test_cell_renders_miss
      @cell.fired_upon
      assert_equal @cell.render, "M"
  end

  def test_cell_renders_hit
    cruiser = Ship.new("Cruiser",3)
    @cell.place_ship(cruiser)
    @cell.fired_upon
    assert_equal @cell.render, "H"
  end

  def test_cell_renders_sunk
    cruiser = Ship.new("Cruiser",3)
    @cell.place_ship(cruiser)
    3.times do |fired_upon|
      @cell.fired_upon
    end
  end

end
