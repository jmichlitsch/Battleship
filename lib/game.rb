class Game
  def  play_game
    new_game = Setup.new
    new_game.start_game
    until new_game.player.player_has_lost? or
      new_game.computer.computer_has_lost
    false
    new_game.take_turn
    end
  end
end
