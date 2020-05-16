class Cell
  attr_reader :coordinate,
              :ship
  def initialize(coordinate)
    @coordinate = coordinate
    @fired_upon = false
  end

  def empty?
    !@ship
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true
      if empty? == false
        @ship.hit
      end
  end

  def render(show = false)
    if fired_upon?
      if empty?
      "M"
      elsif ship.sunk?
      "X"
      else
      "H"
      end
    elsif show 
      "S"
    else
      "."
    end
  end
end
