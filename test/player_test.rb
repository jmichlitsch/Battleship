require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/player'

class PlayerTest < Minitest::Test

  def setup
    @board = Board.new
    @player = Player.new(@board)
    @cruiser = Ship.new("Cruiser",3)
    @submarine = Ship.new("Submarine", 2)
  end

  def test_player_exists
    assert_instance_of Player, @player
  end

  def test_player_can_place_ships
    assert_equal ["A1", "A2", "A3"], @player.player_place_ship(@cruiser,["A1","A2","A3"])
  end

  def test_player_can_lose
    @player.ships.push(@cruiser)
    assert_equal @player.player_has_lost?, false
    3.times {@cruiser.hit}
    assert_equal @player.player_has_lost?, true
  end
end
