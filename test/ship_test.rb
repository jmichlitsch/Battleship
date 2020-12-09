require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'

class ShipTest < Minitest::Test
  def setup
    ship = Ship.new("Cruiser", 3)
  end

  def test_ship_exists
    ship = Ship.new("Cruiser", 3)

    assert_instance_of Ship, ship
  end

  def test_ship_has_attributes
    ship = Ship.new("Cruiser", 3)

    assert_equal ship.name, "Cruiser"
    assert_equal ship.length, 3
  end

  require 'pry';binding.pry
end
