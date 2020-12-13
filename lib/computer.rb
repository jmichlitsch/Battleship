class Computer
  def initialize(computer_board)
    @computer_board = computer_board
  end


  def create_computer_board
    # create 2 ships
    ship1 = Ship.new("Cruiser", 3)
    ship2 = Ship.new("Submarine", 2)
    coordinates1 = ["B1", "B2", "B3"]
    coordniates2 = ["A1","A2"]
    @computer_board.place(ship1, coordinates1)
    @computer_board.place(ship1, coordinates2)

  end


end
