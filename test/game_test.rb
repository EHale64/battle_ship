require 'Minitest/autorun'
require 'Minitest/pride'
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
    assert Board, @game.player_board
    assert Board, @game.computer_board
    assert Computer, @game.computer
    assert Ship, @game.player_cruiser
    assert Ship, @game.computer_cruiser
    assert Ship, @game.player_submarine
    assert Ship, @game.computer_submarine
  end
end
