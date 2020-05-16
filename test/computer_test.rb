require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require './lib/game'
require'pry'
class ComputerTest < Minitest::Test
  def setup
    @board = Board.new
    @computer = Computer.new
  end

  def test_it_exists
    assert_instance_of Computer, @computer
  end

  def test_it_randomly_places_ships
    @computer.setup_board

    expected = @board.cells.find_all do |coordinate, cell|
       cell.ship != nil
    end
    assert_equal 3, expected.size
  end
end
