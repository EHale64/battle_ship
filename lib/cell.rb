class Cell
  attr_reader :coordinate,
              :ship
  def initialize(coordinate)
    @coordinate = coordinate
  end

  def empty?
    !@ship
  end

  def place_ship(ship)
    @ship = ship
  end
end
