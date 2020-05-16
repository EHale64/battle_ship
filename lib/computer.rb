require './lib/ship'
require './lib/cell'
require './lib/board'
class Computer

  def setup_board(ship)
    coordinates = cells.map do |coordinate, _|
      coordinate.sample(ship.length)
    end
    if valid_placement?(ship, coordinates)
      place.ship(ship)
    end
  end
end
