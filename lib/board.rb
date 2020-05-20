require './lib/cell'
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

  def valid_coordinates?(coordinates)
    coordinates.all? do |coordinate|
      valid_coordinate?(coordinate)
    end
  end

  def numbers_consecutive?(coordinates)
    range = 1..4
    numbers = coordinates.map do |coordinate|
      coordinate[1].to_i
    end
    consecutive_numbers = (range).each_cons(coordinates.length).to_a
    consecutive_numbers.include?(numbers)
  end

  def letters_consecutive?(coordinates)
    range = "A".."D"
    letters = coordinates.map do |coordinate|
      coordinate[0]
    end
    consecutive_letters = (range).each_cons(coordinates.length).to_a
    consecutive_letters.include?(letters)
  end

  def row_not_diagonal?(coordinates)
    rows = []
    coordinates.each_with_index do |coordinate, index|
      next if coordinates[index + 1] == nil
      rows << (coordinate[0] == coordinates[index + 1][0])
    end
    rows.all?(true)
  end

  def column_not_diagonal?(coordinates)
    column = []
    coordinates.each_with_index do |coordinate, index|
      next if coordinates[index + 1] == nil
      column << (coordinate[1] == coordinates[index + 1][1])
    end
    column.all?(true)
  end

  def valid_placement?(ship, coordinates)
    if valid_coordinates?(coordinates)
      if has_no_ships?(coordinates)
        if ship.length == coordinates.length
          if numbers_consecutive?(coordinates) || letters_consecutive?(coordinates)
            if row_not_diagonal?(coordinates) || column_not_diagonal?(coordinates)
              true
            end
          end
        end
      end
    else
      false
    end
  end

  def has_no_ships?(coordinates)
    coordinates.all? do |coordinate|
      @cells[coordinate].empty?
    end
  end

  def place(ship, coordinates)
    if valid_placement?(ship, coordinates)
      coordinates.each do |coordinate|
        @cells[coordinate].place_ship(ship)
      end
    end
  end

  def render(show = false)
    if show == false
      "   1 2 3 4 \n" +
      " A #{@cells["A1"].render} #{@cells["A2"].render} #{@cells["A3"].render} #{@cells["A4"].render}\n" +
      " B #{@cells["B1"].render} #{@cells["B2"].render} #{@cells["B3"].render} #{@cells["B4"].render}\n" +
      " C #{@cells["C1"].render} #{@cells["C2"].render} #{@cells["C3"].render} #{@cells["C4"].render}\n" +
      " D #{@cells["D1"].render} #{@cells["D2"].render} #{@cells["D3"].render} #{@cells["D4"].render}"
    else
      "   1 2 3 4 \n" +
      " A #{@cells["A1"].render(true)} #{@cells["A2"].render(true)} #{@cells["A3"].render(true)} #{@cells["A4"].render(true)}\n" +
      " B #{@cells["B1"].render(true)} #{@cells["B2"].render(true)} #{@cells["B3"].render(true)} #{@cells["B4"].render(true)}\n" +
      " C #{@cells["C1"].render(true)} #{@cells["C2"].render(true)} #{@cells["C3"].render(true)} #{@cells["C4"].render(true)}\n" +
      " D #{@cells["D1"].render(true)} #{@cells["D2"].render(true)} #{@cells["D3"].render(true)} #{@cells["D4"].render(true)}"
    end
  end
end
