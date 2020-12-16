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

  def player_place_ship(ship, coordinate)
    if @board.valid_placement?(ship, coordinate)
      @board.place(ship, coordinate)
    else
      "Those are invalid coordinates. Please try again:"
    end
  end

  def player_has_lost?
    @ships.all? do |ship|
    ship.sunk?
    end
  end
end
