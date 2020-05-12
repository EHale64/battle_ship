require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/ship'
require './lib/cell'
require 'pry'

class CellTest < Minitest::Test

  def setup
    @cell = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_it_exists
    assert_instance_of Cell, @cell
  end

  def test_it_has_attributes
    assert_equal "B4", @cell.coordinate
    assert_nil @cell.ship
  end

  def test_it_knows_if_empty
    assert @cell.empty?
  end

  def test_it_can_place_ship
    assert @cell.empty?
    @cell.place_ship(@cruiser)
    assert_equal @cruiser, @cell.ship
    refute @cell.empty?
  end

  def test_it_can_be_fired_upon
    refute @cell.fired_upon?
    @cell.place_ship(@cruiser)
    @cell.fire_upon
    assert @cell.fired_upon?
    assert_equal 2, @cell.ship.health
    @cell.fire_upon
    assert @cell.fired_upon?
    assert_equal 1, @cell.ship.health
  end
end
