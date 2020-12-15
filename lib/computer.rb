class Computer
  attr_reader :computer_board
              :ships
  def initialize(computer_board)
    @computer_board = computer_board
    @ships = []
  #  @valid_targets =
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

  def generate_coordinates_for_ship(ship)
    column = ("A".."D").to_a.sample
    row = ("1".."4").to_a.sample
    ship_length = ship.length
    by_row = false
    if row + ship_length < 4
      by_row = true
    end
    by_column = false
    if column.to_ord + ship_length <= "D".to_ord
      by_column = true
    end
  end

  def computer_place_ship(ship, coordinates)
    coordinates = generate_coordinates_for_ship
  end
end
