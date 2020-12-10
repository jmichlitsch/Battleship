class Board

  attr_accessor :cells
  def initialize
    @cells = {}
    create_cells
  end

  def create_cells
      ("A".."D").each do |letter|
        (1..4).each do |number|
          x = "#{letter}#{number}"
          @cells[x] = Cell.new(x)
        end
      end
#      @cells
  end

  def valid_coordinate?(coordinate)
    @cells.key?(coordinate)
  end

  def valid_placement?(ship, coordinate)
    ship.length == coordinate.length &&
    coordinate.each_cons.all?{|length|}

  end
end
