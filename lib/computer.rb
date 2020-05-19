require './lib/ship'
require './lib/cell'
require './lib/board'
class Computer
  def initialize
    @board = Board.new
  end

  def board
    @board
  end

  def setup_board
    place_cruiser
    place_submarine
  end

  def place_cruiser
    ship = Ship.new("Cruiser", 3)
    x = []
    until @board.valid_placement?(ship, x)  do
      x = board.cells.keys.sample(ship.length)
    end
      board.place(ship, x)
  end

  def place_submarine
    ship = Ship.new("Submarine", 2)
    x = []
    until @board.valid_placement?(ship, x)  do
      x = board.cells.keys.sample(ship.length)
    end
      board.place(ship, x)
  end
end
