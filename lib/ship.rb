class Ship

  attr_accessor :name,
                :length
  def initialize(name, length)
  @name = name
  @length = length
  @health = length
  end


  def sunk?
    if health == 0
      true
    else
      false
    end
  end

  def hit
  end
end
