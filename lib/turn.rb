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
    @player.player_data
    until computer_board.valid_target(@player.data)
      puts "Please enter a valid coordinate"
      @player.player_data
    end
    computer_board.shoot(@player.data)
  end

  def computer_shoots
    player_board.valid_target(@computer.where_computer_shoots_next)
  end

  def results_of_turn
    puts "Your shot on #{@player.data} was a #{results_of_shot(@computer_board, @player.data)}."
    puts "My shot on #{@computer.where_computer_shoots_next} was a #{results_of_shot(@player_board, @computer.where_computer_shoots_next)} "
  end

  def results_of_shot(board, target)
    if board.cells[target].render == "X"
      puts "hit and you sunk the #{board.cells[target].ship.name}"
    elsif board.cells[target].render == "H"
      puts "hit"
    else board.cells[target].render == "M"
      puts "miss"
    end
  end

  def new_turn
    display
    player_shoots
    computer_shoots
    results_of_turn
    results_of_shot(@player_board, @player.data)
  end

end
