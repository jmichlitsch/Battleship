class Setup
  attr_reader :player,
              :computer,
              :player_board,
              :computer_board
              :ships

  def initialize
    @player = Player.new(@player_board)
    @computer = Computer.new(@computer_board)
    @player_board = Board.new
    @computer_board = Board.new
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
    computer.computer_place_ship
    instructions
    get_player_ships
    place_player_ship
    play_game
    display_winner
  end

  def instructions
    puts "I have laid out my ships on the grid. \nYou now need to lay out your two ships. \nThe Cruiser is three units long and the Submarine is two units long."
  end

  def get_player_ships
    valid_ships = [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)]
    player.ships = valid_ships
  end

  def place_player_ship
    @player.ships.each do |ship|
      puts "Please enter coordinates for a ship of length: #{ship.length}"
      until @player_board.place(ship, @player.player_data) == true
        puts 'Those are invalid coordinates. Please try again.'
      end
    end
  end

  def play_game
    turn = Turn.new(@player, @player_board, @computer, @computer_board)
    while !@player.has_lost? and !@computer.has_lost?
      turn.new_turn
    end
  end

  def display_winner
    if !@player.has_lost?
      puts "You have won."
    else
      puts "I have won."
    end
  end
end
