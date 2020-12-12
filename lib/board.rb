class Board

  attr_accessor :cells
  def initialize
    @cells = {}
    create_board
  end

  def create_board
      ("A".."D").each do |letter|
        (1..4).each do |number|
          c = "#{letter}#{number}"
          @cells[c] = Cell.new(c)
        end
      end
  end

  def valid_coordinate?(coordinate)
    @cells.key?(coordinate)
  end

  def horizontal_numbers(coordinate)
    x_axis = []
    coordinate.each_cons(2) do |number1, number2|
      x_axis.push(number1[1] == number2[1])
      x_axis.push(number1[0].ord + 1 == number2[0].ord)
    end
    x_axis.all?
  end

  def vertical_letters(coordinate)
    y_axis = []
    coordinate.each_cons(2) do |letter1, letter2|
      y_axis.push(letter1[0] == letter2[0])
      y_axis.push(letter1[1].to_i + 1 ==letter2[1].to_i)
    end
    y_axis.all?
  end

  def consecutive(coordinate)
    if horizontal_numbers(coordinate) == true
      true
    elsif vertical_letters(coordinate) == true
      true
    else
      false
    end
  end

  def does_not_overlap_with_cells(coordinate)
    coordinate.each do |coord|
      cell = @cells[coord]
      if cell.occupied?
        false
      end
    end
    true
  end

  def valid_placement?(ship, coordinate)
    ship.length == coordinate.length &&
    consecutive(coordinate) == true &&
    does_not_overlap_with_cells(coordinate)
  end

  def place(ship, coordinate)
    valid = self.valid_placement?(ship, coordinate)
    # ["C1", "C2", "C3"]
    if valid
      coordinate.each do |coord|
        cell_object = @cells[coord]
        cell_object.place_ship(ship)
      end
    end
  end

  def render(default = false)
    "   1  2  3  4  \n" +
    "A  #{@board[0..7]} \n" +
    "B  #{@board[8..15]} \n" +
    "C  #{@board[16..23]} \n" +
    "D  #{@board[23..31]} \n"
  end
end
