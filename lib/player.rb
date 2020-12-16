class Player
  attr_accessor :name,
                :ships,
                :data

  def initialize(board)
    @board = board
    @ships = []
  end

  def player_data
    @data = gets.chomp.upcase
  end

  def place_player_ship
  @player.ships.each do |ship|
    puts "Please enter coordinates for a ship of length: #{ship.length}"
    until @player_board.place(ship, @player.player_data) == true
      puts 'Those are invalid coordinates. Please try again.'
    end
  end
end

  def player_has_lost?
    @ships.all? do |ship|
    ship.sunk?
    end
  end
end
