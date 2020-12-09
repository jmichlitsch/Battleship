require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'

class ShipTest < Minitest::Test

  def test_ship_exists
    ship = Ship.new("Cruiser", 3)

    assert_instance_of Ship, ship
  end

  def test_ship_has_attributes
    ship = Ship.new("Cruiser", 3)

    assert_equal ship.name, "Cruiser"
    assert_equal ship.length, 3
  end

  def test_ship_has_health
    ship = Ship.new("Cruiser", 3)

    assert_equal ship.health, 3
  end

  def test_ship_can_take_hits
    ship = Ship.new("Cruiser", 3)
    ship.hit

    assert_equal ship.health , 2
  end

  def test_ship_can_sink
    ship = Ship.new("Cruiser", 3)
    3.times do |hit|
      ship.hit
    end

    assert_equal ship.sunk?, true
  end
end
