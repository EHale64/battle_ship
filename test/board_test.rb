require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require 'pry'

class BoardTest < Minitest::Test
  def setup
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def test_it_exists
    assert_instance_of Board, @board
  end

  def test_it_has_cells
    assert Hash, @board.cells
    assert 16, @board.cells.length
    assert Cell, @board.cells["A1"]
  end

  def test_it_can_validate_coordinates
    assert @board.valid_coordinate?("A1")
    assert @board.valid_coordinate?("D4")
    refute @board.valid_coordinate?("A5")
    refute @board.valid_coordinate?("E1")
    refute @board.valid_coordinate?("A22")
  end

  def test_it_coordinate_length_equal_ship_length
    refute @board.valid_placement?(@cruiser, ["A1", "A2"])
    assert @board.valid_placement?(@cruiser, ["A1", "A2", "A3"])
    assert @board.valid_placement?(@submarine, ["B1", "B2"])
    refute @board.valid_placement?(@submarine, ["A2", "A3", "A4"])
  end

  def test_it_finds_consecutive_numbers
    refute @board.numbers_consecutive?(["A1", "A2", "A4"])
    assert @board.numbers_consecutive?(["A2", "A3", "A4"])
    refute @board.numbers_consecutive?(["B1", "B3"])
    assert @board.numbers_consecutive?(["B1", "B2"])
  end

  def test_it_finds_consecutive_letters
    refute @board.letters_consecutive?(["A1", "A2", "A4"])
  end
end
