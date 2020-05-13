class Board
  attr_reader :cells

  def initialize(size = 16)
    @cells = Hash.new
    @cells["A1"] = Cell.new("A1")
    @cells["A2"] = Cell.new("A2")
    @cells["A3"] = Cell.new("A3")
    @cells["A4"] = Cell.new("A4")
    @cells["B1"] = Cell.new("B1")
    @cells["B2"] = Cell.new("B2")
    @cells["B3"] = Cell.new("B3")
    @cells["B4"] = Cell.new("B4")
    @cells["C1"] = Cell.new("C1")
    @cells["C2"] = Cell.new("C2")
    @cells["C3"] = Cell.new("C3")
    @cells["C4"] = Cell.new("C4")
    @cells["D1"] = Cell.new("D1")
    @cells["D2"] = Cell.new("D2")
    @cells["D3"] = Cell.new("D3")
    @cells["D4"] = Cell.new("D4")
  end

  def valid_coordinate?(coordinate)
     @cells.has_key?(coordinate)
  end

  def valid_placement?(ship, coordinates)
    ship.length == coordinates.length
  end

  def numbers_consecutive?(coordinates)
    range = 1..4
    numbers = []
    coordinates.each do |coordinate|
        numbers << coordinate[1].to_i
    end
    consecutive_numbers = (range).each_cons(coordinates.length).to_a
    consecutive_numbers.include?(numbers)
  end

  def letters_consecutive?(coordinates)
    range = "A".."D"
    letters = []
    coordinates.each do |coordinate|
        letters << coordinate[0]
    end
    consecutive_letters = (range).each_cons(coordinates.length).to_a
    consecutive_letters.include?(letters)
  end
end
