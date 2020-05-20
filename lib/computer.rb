require './lib/ship'
require './lib/cell'
require './lib/board'

class Computer
  attr_reader :board

  def initialize
    @board = Board.new
  end

  def board
    @board
  end

  def random_coordinates(ship)
    board.cells.keys.sample(ship.length)
  end

  def place(ship)
    x = []
    until @board.valid_placement?(ship, x)  do
      x = random_coordinates(ship)
    end
    board.place(ship, x)
  end

  def setup_board(ships)
    ships.each do |ship|
      place(ship)
    end
  end

end
