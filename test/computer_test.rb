require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'

class ComputerTest < Minitest::Test

  def setup
    computer_board = Board.new
    @computer = Computer.new(computer_board)
  end

  def test_computer_exists
    assert_instance_of Computer, @computer
  end

  def test_computer_has_ships
    cruiser = Ship.new("Cruiser", 3)
    assert_instance_of Ship, cruiser
  end

  def test_computer_can_place_ships
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    assert_instance_of Array, @computer.computer_place_ship(cruiser)
  end

  def test_computer_target_selection
    assert_equal @computer.valid_targets.count, 16
    @computer.where_computer_shoots_next
    assert_equal @computer.valid_targets.count, 15
  end
  
end
