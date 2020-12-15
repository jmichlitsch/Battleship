require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'

class BoardTest < Minitest::Test

  def setup
    @board = Board.new
  end

  def test_board_exists
    assert_instance_of Board, @board
  end

  def test_board_has_valid_coordinates
    assert_equal true, @board.valid_coordinate?("A1")
    assert_equal true, @board.valid_coordinate?("D4")
    assert_equal false, @board.valid_coordinate?("A5")
    assert_equal false, @board.valid_coordinate?("E1")
    assert_equal false, @board.valid_coordinate?("A22")
  end

  def test_placement_is_valid?
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    assert_equal false, @board.valid_placement?(cruiser, ["A1", "A2"])
    assert_equal false, @board.valid_placement?(submarine, ["A2", "A3", "A4"])
  end

  def test_coordinates_are_consecutive
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    assert_equal false, @board.valid_placement?(cruiser, ["A1", "A2", "A4"])
    assert_equal false, @board.valid_placement?(submarine, ["A1", "C1"])
    assert_equal false, @board.valid_placement?(cruiser, ["A3", "A2", "A1"])
    assert_equal false, @board.valid_placement?(submarine, ["C1", "B1"])
  end

  def test_coordinates_are_not_diagonal
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    assert_equal false, @board.valid_placement?(cruiser, ["A1", "B2", "C3"])
    assert_equal false, @board.valid_placement?(submarine, ["C2", "D3"])
  end

  def test_coordinates_can_be_valid
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    assert_equal true, @board.valid_placement?(submarine, ["A1", "A2"])
    assert_equal true, @board.valid_placement?(cruiser, ["B1", "C1", "D1"])
  end

  def test_if_coordinates_are_empty_by_default
    assert_equal true, @board.does_not_overlap_with_cells(["A1"])
  end

  def test_if_ships_overlap
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    @board.place(cruiser, ["A1", "A2", "A3"])
    @board.place(submarine, ["A1", "A2"])
    assert_equal false, @board.valid_placement?(submarine, ["A1", "A2"])
    # I think place method needs to be called here?
  end

  def test_board_can_place_ship
    cruiser = Ship.new("Cruiser", 3)
    @board.place(cruiser, ["A1", "A2", "A3"])
    assert_equal @board.cells["A1"].ship, cruiser
    assert_equal @board.cells["A2"].ship, cruiser
    assert_equal @board.cells["A3"].ship, cruiser
  end

  def test_board_can_render_empty
    expected = "  1 2 3 4 \nA  . . . .\nB  . . . .\nC  . . . .\nD  . . . .\n "
    assert_equal @board.render(default = false), expected
  end
end
