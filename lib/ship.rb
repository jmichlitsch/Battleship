class Ship

  attr_accessor :name,
                :length,
                :health
  def initialize(name, length)
    @name = name
    @length = length
    @health = length
    @health = health
  end


  def hit
    @health -= 1
  end

  def sunk?
    if @health == 0
      true
    else
      false
    end
  end

end
