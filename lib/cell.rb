class Cell

  attr_accessor :type,
                :shot
  attr_reader :coordinate,
              :ship
  def initialize(coordinate)
    @coordinate = coordinate
    @type = 'Water'
    @ship = nil
    @shot = false
  end

  def empty?
    @ship.nil?
  end

  def place_ship(ship)
    @type = ship
    @ship = ship
  end

  def fired_upon?
    @shot
  end

  def fired_upon
    @shot = true
    if place_ship(ship)
      @ship.hit
    end
  end

  def render
    if empty? == true && @shot == true
      "M"
    elsif empty? == false && @shot == true && ship.sunk? == true
      "X"
    elsif empty? == false && @shot == true && ship.sunk? == false
      "H"
    else
      "."
    end
  end

end
