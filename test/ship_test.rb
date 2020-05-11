require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/ship'
require 'pry'

class ShipTest < Minitest::Test

  def setup
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_it_exists

    assert_instance_of Ship, @cruiser
  end

  def test_it_has_attributes

    assert_equal "Cruiser", @cruiser.name
    assert_equal 3, @cruiser.length
    assert_equal 3, @cruiser.health
  end

  def test_it_can_be_hit
    @cruiser.hit
    assert_equal 2, @cruiser.health
  end

  def test_it_can_tell_if_sunk
    refute @cruiser.sunk?
    @cruiser.hit
    refute @cruiser.sunk?
    @cruiser.hit
    refute @cruiser.sunk?
    @cruiser.hit
    assert @cruiser.sunk?
  end

end
