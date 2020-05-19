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
    @cruiser = Ship.new("Cruiser", 3)
    @computer = Computer.new
    @game = Game.new(@player_board, @computer_board)
  end

  def test_it_exists
    assert_instance_of Computer, @computer
  end

  def test_it_has_board
    assert_equal Board, @computer.board.class
  end

  def test_it_randomly_places_ships
    @computer.setup_board
    cell_1 = @computer.board.cells["B1"]
    cell_2 = @computer.board.cells["B2"]
    cell_3 = @computer.board.cells["B3"]
    cell_4 = @computer.board.cells["B4"]
    cell_5 = @computer.board.cells["A2"]
    cell_6 = @computer.board.cells["C2"]
    cell_7 = @computer.board.cells["D2"]
    cell_1.fire_upon
    cell_2.fire_upon
    cell_3.fire_upon
    cell_4.fire_upon
    cell_5.fire_upon
    cell_6.fire_upon
    cell_7.fire_upon
      expected = " 1 2 3 4 \n" +
                "A . . . . \n" +
                "B . . . . \n" +
                "C . . . . \n" +
                "D . . . . \n"
    assert_equal   expected, @computer.board.render
  end
end
