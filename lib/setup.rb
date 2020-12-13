class Setup
  attr_reader :player,
              :computer,
              :player_board,
              :computer_board

  def initialize
    @player = Player.new
    @computer = Computer.new
    @player_board = Board.new
    @computer_board = Board.new
  end
end
