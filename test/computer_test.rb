require 'Minitest/autorun'
require 'Minitest/pride'
require 'mocha/minitest'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require './lib/game'
require'pry'

class ComputerTest < Minitest::Test
  def setup
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @computer = Computer.new
    @game = Game.new#(@player_board, @computer_board)
  end

  def test_it_exists
    assert_instance_of Computer, @computer
  end

  def test_it_has_board
    assert_equal Board, @computer.board.class
  end

  def test_it_gets_random_coordinates
    @computer.expects(:random_coordinates).returns(["B1", "B2", "B3"])
    assert_equal ["B1", "B2", "B3"], @computer.random_coordinates(@cruiser)
  end

  def test_it_randomly_places_ships
    skip
    x = mock("coordinates")
    @computer.expects(:random_coordinates).returns(["B1", "B2", "B3"])
    @computer.expects(:random_coordinates).returns(["C1", "C2"])
    @computer.setup_board(@cruiser)
    cell_1 = @computer.board.cells["B1"]
    cell_2 = @computer.board.cells["B2"]
    cell_3 = @computer.board.cells["B3"]
    assert_equal   "Cruiser", cell_1.ship.name
    assert_equal   "Cruiser", cell_2.ship.name
    assert_equal   "Cruiser", cell_3.ship.name
  end

  def test_it_can_find_random_cell
    @computer.expects(:computer_fire).returns(@computer.board.cells["B1"])
    cell_1 = @computer.board.cells["B1"]
    cell_1.fired_upon?
    assert_equal cell_1, @computer.computer_fire
  end

  def test_it_can_fire_on_random_cell
    @computer.computer_fire
    result = @computer.board.cells.map do | _ , cell|
      cell.fired_upon?
    end
    assert_equal 1, result.count(true)
  end

  def test_it_wont_fire_on_cell_twice
    10.times do @computer.computer_fire
    end
    result = @computer.board.cells.map do | _ , cell|
      cell.fired_upon?
    end
    assert_equal 10, result.count(true)
  end
end
