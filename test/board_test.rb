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
    refute @board.numbers_consecutive?(["A3", "A2", "A1"])
  end

  def test_it_finds_consecutive_letters
    refute @board.letters_consecutive?(["A1", "B1", "D1"])
    assert @board.letters_consecutive?(["A1", "B1", "C1"])
    refute @board.letters_consecutive?(["B1", "A1"])
    assert @board.letters_consecutive?(["C1", "D1"])
  end

  def test_it_finds_consecutive_coordinates
    refute @board.valid_placement?(@cruiser, ["A1", "A2", "A4"])
    assert @board.valid_placement?(@cruiser, ["A2", "A3", "A4"])
    refute @board.valid_placement?(@submarine, ["B1", "B3"])
    assert @board.valid_placement?(@submarine, ["B1", "B2"])
    refute @board.valid_placement?(@cruiser, ["A1", "B1", "D1"])
    assert @board.valid_placement?(@cruiser, ["A1", "B1", "C1"])
    refute @board.valid_placement?(@submarine, ["B1", "A1"])
    assert @board.valid_placement?(@submarine, ["C1", "D1"])
  end

  def test_it_cannot_be_diagonal
    refute @board.row_not_diagonal?(["A1", "B2", "C3"])
    assert @board.row_not_diagonal?(["A1", "A2", "A3"])
    assert @board.column_not_diagonal?(["A1", "B1"])
    refute @board.column_not_diagonal?(["A1", "B2"])
  end

  def test_it_knows_if_diagonal
    refute @board.valid_placement?(@cruiser, ["A1", "B2", "C3"])
    assert @board.valid_placement?(@cruiser, ["A1", "A2", "A3"])
    assert @board.valid_placement?(@submarine, ["A1", "B1"])
    refute @board.valid_placement?(@submarine, ["A1", "B2"])
  end

  def test_it_can_place_a_ship
    cell_1 = @board.cells["B1"]
    cell_2 = @board.cells["B2"]
    cell_3 = @board.cells["B3"]
    @board.place(@cruiser, ["B1", "B2", "B3"])
    assert_equal @cruiser, cell_1.ship
    assert_equal @cruiser, cell_2.ship
    assert_equal @cruiser, cell_3.ship
    assert_equal true , cell_3.ship == cell_2.ship
  end
end
