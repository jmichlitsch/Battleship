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
    coordinate.all? do |coord|
      @cells[coord].empty?
    end

  end

  def valid_placement?(ship, coordinate)
    ship.length == coordinate.length &&
    consecutive(coordinate) == true &&
    does_not_overlap_with_cells(coordinate)
  end

  def place(ship, coordinate)
    if coordinate.is_a?(String)
      coordinate = coordinate.split
    end
    valid = valid_placement?(ship, coordinate)
    # ["C1", "C2", "C3"]
    if valid
      coordinate.each do |coord|
        cell_object = @cells[coord]
        cell_object.place_ship(ship)
      end
      true
    end
  end

  def valid_target(target)
    if valid_coordinate?(target)
      !@cells[target].fire_upon?
    end
  end

  def shoot(target)
    @cells[target].fired_upon
  end

  def render(default = false)
    " 1 2 3 4 \n" +
    "A    #{@cells["A1"].render} #{@cells["A2"].render} #{@cells["A3"].render} #{@cells["A4"].render}\n" +
    "B    #{@cells["B1"].render} #{@cells["B2"].render} #{@cells["B3"].render} #{@cells["B4"].render}\n" +
    "C    #{@cells["C1"].render} #{@cells["C2"].render} #{@cells["C3"].render} #{@cells["C4"].render}\n" +
    "D    #{@cells["D1"].render} #{@cells["D2"].render} #{@cells["D3"].render} #{@cells["D4"].render}\n"
  end
end
