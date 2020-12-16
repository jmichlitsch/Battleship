class Setup
  attr_reader :player,
              :computer,
              :player_board,
              :computer_board
              :ships

  def initialize
    @player_board = Board.new
    @computer_board = Board.new
    @player = Player.new(@player_board)
    @computer = Computer.new(@computer_board)
  end

  def main_menu
    puts "Welcome to BATTLESHIP \nEnter p to play. Enter q to quit."
    response = gets.chomp.downcase
    if response == "p"
      start_game
    elsif response == "q"
      exit_game
    else
      "Invalid Response, \nEnter p to play. Enter q to quit."
    end
  end

  def start_game
    computer.create_computer_board
    computer.computer_place_ship(@computer.ships[0])
    computer.computer_place_ship(@computer.ships[1])
    instructions
    get_player_ships
    place_player_ship
    # start the game, taking turns with each other
  end


  def exit_game

  end

  def instructions
    puts "I have laid out my ships on the grid. \nYou now need to lay out your two ships. \nThe Cruiser is three units long and the Submarine is two units long."
  end

  def get_player_ships
    valid_ships = [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)]
    player.ships = valid_ships
  end

  def place_player_ship
    until @player_board.place(ship,@player.player_data) == true
      "Those are invalid coordinates. Please try again."
      def place_player_ship
    until @player_board.place(@computer.ships[0],@player.player_data) == true
      "Those are invalid coordinates. Please try again."
    end
  end
    end
  end

  def take_turn
    valid_turn= Turn.new(player, player_board, computer, computer_board)
    valid_turn.new_turn
  end

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
