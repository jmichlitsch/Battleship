class Computer
  attr_reader :board,
              :ships,
              :valid_targets
  def initialize(board)
    @board = board
    @ships = []
    @valid_targets = @board.cells.keys.shuffle
  end


  def create_computer_board
    # create 2 ships
    ship1 = Ship.new("Cruiser", 3)
    ship2 = Ship.new("Submarine", 2)
    # coordinates1 = ["B1", "B2", "B3"]
    # coordniates2 = ["A1","A2"]
    # @computer_board.place(ship1, coordinates1)
    # @computer_board.place(ship1, coordinates2)
  end

  def generate_coordinates_for_ship(ship, length)
    # column = ("A".."D").to_a.sample
    # row = ("1".."4").to_a.sample
    # ship_length = ship.length
    # by_row = false
    # if row + ship_length < 4
    #   by_row = true
    # end
    # by_column = false
    # if column.to_ord + ship_length <= "D".to_ord
    #   by_column = true
    # end
    coordinates = []
    until board.valid_placement?(ship, coordinates)
      computer_coordinates = board.cells.keys.sample(length)
      coordinates = computer_coordinates
    end
    coordinates
  end

  def computer_place_ship(ship)
    coordinates = generate_coordinates_for_ship(ship, ship.length)
    @board.place(ship, coordinates)
  end

  def where_computer_shoots_next
    @valid_targets.shift
  end
end
