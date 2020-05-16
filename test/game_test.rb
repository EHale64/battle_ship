require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

class GameTest < Minitest::Test
  def setup
    @player_board = Board.new
    @computer_board = Board.new
    @game = Game.new(@player_board, @computer_board)
  end

  def test_it_exists
    assert_instance_of Game, @game
  end

  def test_computer_sets_up_ships
    expected = @board.cells.find_all do |cell|
      cell.ship != nil
    end
    assert_equal 5, expected.size
  end
end
