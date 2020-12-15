require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require './lib/player'
require './lib/turn'

class TurnTest < Minitest::Test
  def setup
    board = Board.new
    @computer_board = Board.new
    @player_board = Board.new
    @player = Player.new(@player_board)
    @computer = Computer.new(@computer_board)
    @turn = Turn.new(@player, @player_board, @computer, @computer_board)
  end

  def test_turn_exists
    assert_instance_of Turn, @turn
  end

  def test_display_works
    skip
    @turn.display
    # require 'pry'; binding.pry
    assert_equal @turn.display, "=============COMPUTER BOARD=============" "\n==============PLAYER BOARD=============="
  end
end
