class Turn
  attr_reader :player,
              :player_board,
              :computer,
              :computer_board
  def initialize(player, player_board, computer, computer_board)
    @player = player
    @player_board = player_board
    @computer = computer
    @computer_board = computer_board
  end

  def display
    puts "\n=============COMPUTER BOARD=============\n
    #{computer_board.render}
    \n==============PLAYER BOARD==============
    #{player_board.render(true)}"

  end

  def player_shoots
    puts "Enter the coordinate for your shot:"
    until computer_board.valid_target(@player.player_data)
      "Please enter a valid coordinate:"
    end
    computer_board.shoots(@player.player_data)
  end

  def computer_shoots
    player_board.valid_target(@computer.where_computer_shoots_next)
  end

  def results_of_turn
    puts "Your shot on #{@player.player_data} was a #{results_of_shot(@computer_board, @player.player_data)}."
    puts "My shot on #{@computer.where_computer_shoots_next} was a #{results_of_shot(@player_board, @computer.where_computer_shoots_next)} "
  end

  def results_of_shot(board, target)
    if @board.cells[target].render == "X"
      "hit and you sunk the #{@board.cells[target].ship.name}"
    elsif @board.cells[target].render == "H"
      "hit"
    else @board.cells[target].render == "M"
      "miss"
    end
  end

end
