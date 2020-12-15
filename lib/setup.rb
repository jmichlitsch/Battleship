class Setup
  attr_reader :player,
              :computer,
              :player_board,
              :computer_board

  def initialize
    @player = Player.new(Board.new)
    @computer = Computer.new(Board.new)
    # @player_board = Board.new
    # @computer_board = Board.new
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
    instructions
    get_player_board

    # start the game, taking turns with each other
  end

  def exit_game

  end
    
  def instructions
    puts "I have laid out my ships on the grid. \nYou now need to lay out your two ships. \nThe Cruiser is three units long and the Submarine is two units long."
  end

  def get_player_board

  end
end
