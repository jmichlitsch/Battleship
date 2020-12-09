require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'

class Shiptest < Minitest::Test
  def test_ship_exists
    ship = Ship.new("Cruiser", 3)

    assert_instance_of Ship, ship
  end

  def test_ship_has_readable_attributes
    ship = Ship.new("Cruiser", 3)

    assert_equal ship.name , "Cruiser"
    assert_equal ship.length, 3
  end  
end
