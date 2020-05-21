require 'Minitest/autorun'
require 'Minitest/pride'
require 'mocha/minitest'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

class GameTest < Minitest::Test
  def setup
    @game = Game.new
  end

  def test_it_exists
    assert_instance_of Game, @game
  end

  def test_it_has_attributes
    assert Computer, @game.computer
    assert Board, @game.player_board
    assert Board, @game.computer_board
    assert Ship, @game.player_cruiser
    assert Ship, @game.player_submarine
    assert Ship, @game.computer_cruiser
    assert Ship, @game.computer_submarine
  end

  def test_it_can_find_random_cell
    @game.expects(:computer_fire).returns(@game.player_board.cells["B1"])
    cell_1 = @game.player_board.cells["B1"]
    cell_1.fired_upon?
    assert_equal cell_1, @game.computer_fire
  end

  def test_it_can_fire_on_random_cell
    @game.computer_fire
    result = @game.player_board.cells.map do | _ , cell|
      cell.fired_upon?
    end
    assert_equal 1, result.count(true)
  end

  def test_it_wont_fire_on_cell_twice
    16.times do @game.computer_fire
    end
    result = @game.player_board.cells.map do | _ , cell|
      cell.fired_upon?
    end
    assert_equal 16, result.count(true)
  end
end
